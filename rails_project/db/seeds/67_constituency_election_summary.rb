
puts "Creating Contituency Election Summaries"

def create_election_result_summary(election)

  params_hash = { election_rankable: election.result, prediction: false,
                  description: "#{election.description} Results" }

  params_hash[:election_date] = election.election_date
  params_hash[:election_type] = election.election_type
  params_hash[:electorate_size] = election.electorate_size
  params_hash[:turnout_percent] = election.turnout_percent
  params_hash[:postal_percent] = election.postal_percent

  votes = election.actual_votes.to_a.sort { |a,b| b.votes <=> a.votes }
  if !votes.empty? then

    (0..votes.size-1).each do |i|
      pos = i+1
      if (1..5).include?(pos) then
        params_hash["party_#{pos}_id"] = votes[i].party.id
        params_hash["party_#{pos}_votes"] = votes[i].votes
        params_hash["party_#{pos}_vote_share_percent"] = votes[i].vote_share_percent
        if i == 0 then
          params_hash["party_#{pos}_ahead_behind"] = votes[0].votes - votes[i].votes
          params_hash["party_#{pos}_ahead_behind_percent"] = votes[0].vote_share_percent - votes[i].vote_share_percent
        else
          params_hash["party_#{pos}_ahead_behind"] = votes[i].votes - votes[0].votes
          params_hash["party_#{pos}_ahead_behind_percent"] = votes[i].vote_share_percent - votes[0].vote_share_percent
        end
      end

      party_id = votes[i].party.id
      if ["CON", "LAB", "LD", "GRN", "UKIP", "SNP", "PC"].include?(party_id) then
        party_id = party_id.downcase
        params_hash["#{party_id}_id"] = votes[i].party.id
        params_hash["#{party_id}_position"] = pos
        params_hash["#{party_id}_votes"] = votes[i].votes
        params_hash["#{party_id}_vote_share_percent"] = votes[i].vote_share_percent
        if i == 0 then
          params_hash["#{party_id}_ahead_behind"] = votes[0].votes - votes[i].votes
          params_hash["#{party_id}_ahead_behind_percent"] = votes[0].vote_share_percent - votes[i].vote_share_percent
        else
          params_hash["#{party_id}_ahead_behind"] = votes[i].votes - votes[0].votes
          params_hash["#{party_id}_ahead_behind_percent"] = votes[i].vote_share_percent - votes[0].vote_share_percent
        end
      end
    end

    p params_hash
    ConstituencyElectionSummary.create!(params_hash)
  end
end


def create_election_prediction_summary(prediction)

  params_hash = { election_rankable: prediction, prediction: true,
                  description: "#{prediction.constituency_election.description} #{prediction.prediction_description}" }

  params_hash[:election_date] = prediction.election.election_date
  params_hash[:election_type] = prediction.election.election_type
  params_hash[:electorate_size] = nil
  params_hash[:turnout_percent] = nil
  params_hash[:postal_percent] = nil

  votes = prediction.predicted_votes.to_a.sort { |a,b| b.votes <=> a.votes }
  if !votes.empty? then

    (0..votes.size-1).each do |i|
      pos = i+1
      if [1..5].include?(pos) then
        params_hash["party_#{pos}_id"] = votes[i].party.id
        params_hash["party_#{pos}_votes"] = nil
        params_hash["party_#{pos}_vote_share_percent"] = votes[i].vote_share_percent
        if i == 0 then
          params_hash["party_#{pos}_ahead_behind"] = nil
          params_hash["party_#{pos}_ahead_behind_percent"] = votes[0].vote_share_percent - votes[i].vote_share_percent
        else
          params_hash["party_#{pos}_ahead_behind"] = nil
          params_hash["party_#{pos}_ahead_behind_percent"] = votes[i].vote_share_percent - votes[0].vote_share_percent
        end
      end

      party_id = votes[i].party.id
      if ["CON", "LAB", "LD", "GRN", "UKIP", "SNP", "PC"].include?(party_id) then
        party_id = party_id.downcase
        params_hash["#{party_id}_id"] = votes[i].party.id
        params_hash["#{party_id}_position"] = pos
        params_hash["#{party_id}_votes"] = nil
        params_hash["#{party_id}_vote_share_percent"] = votes[i].vote_share_percent
        if i == 0 then
          params_hash["#{party_id}_ahead_behind"] = nil
          params_hash["#{party_id}_ahead_behind_percent"] = votes[0].vote_share_percent - votes[i].vote_share_percent
        else
          params_hash["#{party_id}_ahead_behind"] = nil
          params_hash["#{party_id}_ahead_behind_percent"] = votes[i].vote_share_percent - votes[0].vote_share_percent
        end
      end
    end

    ConstituencyElectionSummary.create!(params_hash)
  end
end


ConstituencyElection.all.each do |election|
  create_election_result_summary(election)

  election.predictions.each { |prediction| create_election_prediction_summary(prediction) }
end
