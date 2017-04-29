require 'linefit'

# Notes:

# Exclude the Batley & Spen byelection (constituency E14000548)
# Figures not representative as Labour was the only major candidate standing

# No byelections in Scotland or NI, only one in Wales, so we cannot build up
# a line of best fit for the national parties (SNP, Plaid Cymru).
# Therefore, only include byelections in England, and only make predictions
# for England

# Only calculate swings / predictions for the 5 main parties in England:
# Conservatives, Labour, Lib Dems, UKIP, Greens


puts "Calculating 2017 Predictions using Post 2015 byelections Brexit swing data"

parties = ['LAB', 'UKIP', 'CON', 'LD', 'GRN']
party_coords = Hash[ parties.map { |party| [party, {x:[], y:[]}] } ]
party_lines = Hash[ parties.map { |party| [party, LineFit.new] } ]

# Get all byelections since the 2015 general election and store, for each party,
# the brexit vote in the constituency and the swing for the party
post_ge2015_byelections = ConstituencyElection.where(election_type: "By Election")
    .where("election_date BETWEEN ? AND ?", Date.new(2015,5,7), Date.new(2017,6,8))
    .where("constituency_id <> ?", 'E14000548')
    .order(:election_date, :constituency_id)

post_ge2015_byelections.each do |byelection|
  p byelection
  if (byelection.constituency.region.country == 'England') then
    p byelection
    byelection.constituency_election_candidate_votes.each do |candidate_vote|
      p candidate_vote
      if parties.include?(candidate_vote.party_id) then
        p candidate_vote
        party_coords[candidate_vote.party_id][:x].push(byelection.constituency.constituency_eu_vote.leave_vote_percent_to_use)
        party_coords[candidate_vote.party_id][:y].push(candidate_vote.percent_change_from_last_ge)
      end
    end
  end
end

# Populate the LineFit for each party
parties.each do |party|
  p party_coords[party][:x]
  p party_coords[party][:y]

  party_lines[party].setData( party_coords[party][:x], party_coords[party][:y] )

  p party_lines[party]
end

# loop through each constituency, look up the 2015 votes per party, and apply
# the swing using the LineFit to predict swing per party based on Brexit vote
ge2015_elections = ConstituencyElection.where(election_type: "General Election", election_date: Date.new(2015,5,7)).order(:constituency_id)

ge2015_elections.each do |election|
  if (election.constituency.region.country == 'England') then
    constituency_election = ConstituencyElection.create(
        constituency_id: election.constituency_id,
        election_type: "General Election", election_sub_type: "",
        election_date: Date.new(2017,6,8))

    election.constituency_election_candidate_votes.each do |election_votes|
      if (parties.include?(election_votes.party_id)) then
        predicted_swing = party_lines[election_votes.party_id].forecast(election.constituency.constituency_eu_vote.leave_vote_percent_to_use)

        ConstituencyElectionPrediction.create(
            constituency_election_id: constituency_election.id,
            prediction_description: "Post 2015 byelections Brexit swing predictions",
            party_id: election_votes.party_id,
            predicted_swing: predicted_swing,
            predicted_vote_share_percent: election_votes.vote_share_percent + predicted_swing)
      end
    end
  end
end
