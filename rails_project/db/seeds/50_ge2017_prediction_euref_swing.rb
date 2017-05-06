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


puts "Calculating 2017 Predictions using Post-2015 byelections Brexit swing data"

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
  if (byelection.constituency.region.country_id == 'England') then
    byelection.actual_votes.each do |candidate_vote|
      if parties.include?(candidate_vote.party_id) then
        party_coords[candidate_vote.party_id][:x].push(byelection.constituency.constituency_eu_vote.leave_vote_percent_to_use)
        party_coords[candidate_vote.party_id][:y].push(candidate_vote.percent_change_from_last_ge)
      end
    end
  end
end

# Populate the LineFit for each party
parties.each do |party|
  party_lines[party].setData( party_coords[party][:x], party_coords[party][:y] )
end

# loop through each constituency, look up the 2015 votes per party, and apply
# the swing using the LineFit to predict swing per party based on Brexit vote
constituencies =  Country.find('England').regions.map { |r| r.constituencies }.flatten

constituencies.each do |constituency|
  ge_2015_election = ConstituencyElection.find_by(constituency: constituency, election_type: "General Election", election_date: Date.new(2015,5,7))
  ge_2017_election = ConstituencyElection.find_by(constituency: constituency, election_type: "General Election", election_date: Date.new(2017,6,8))

  ge_2017_prediction = ConstituencyElectionPrediction.create!(
      constituency_election: ge_2017_election,
      prediction_description: "Remain/Leave vote share swing predictions (post-2015 byelections)")

  parties.each do |party|
    ge_2015_election_vote = ConstituencyElectionVote.find_by(election_voteable: ge_2015_election.result, party_id: party)

    predicted_swing = party_lines[party].forecast(constituency.eu_vote.leave_vote_percent_to_use)
    predicted_vote_share_percent = [(ge_2015_election_vote.try(:vote_share_percent) || 0) + predicted_swing, 0].max

    ConstituencyElectionVote.create!(
        election_voteable: ge_2017_prediction,
        party_id: party,
        vote_share_percent: predicted_vote_share_percent,
        percent_change_from_last_ge: predicted_swing)
  end
end
