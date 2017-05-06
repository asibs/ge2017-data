
puts "Creating Contituency Election Party Rankings"

def create_election_result_rank(election)
  votes = election.actual_votes.to_a.sort { |a,b| b.votes <=> a.votes }
  if !votes.empty? then

    params_hash = { election_rankable: election.result, prediction: false,
                    description: "#{election.description} Results" }
    (0..4).each do |i|
      if !votes[i].nil? then
        params_hash["party_#{i+1}_id"] = votes[i].party.id
        params_hash["party_#{i+1}_votes"] = votes[i].votes
        params_hash["party_#{i+1}_vote_share_percent"] = votes[i].vote_share_percent
        params_hash["party_#{i+1}_votes_behind"] = votes[0].votes - votes[i].votes
        params_hash["party_#{i+1}_vote_share_percent_behind"] = votes[0].vote_share_percent - votes[i].vote_share_percent
      end
    end

    ConstituencyElectionPartyRank.create!(params_hash)
  end
end


def create_election_prediction_rank(prediction)
  predicted_votes = prediction.predicted_votes.to_a.sort { |a,b| b.vote_share_percent <=> a.vote_share_percent }
  if !predicted_votes.empty? then

    params_hash = { election_rankable: prediction, prediction: true,
                    description: "#{prediction.constituency_election.description} #{prediction.prediction_description}" }
    (0..4).each do |i|
      if !predicted_votes[i].nil? then
        params_hash["party_#{i+1}_id"] = predicted_votes[i].party.id
        params_hash["party_#{i+1}_votes"] = nil
        params_hash["party_#{i+1}_vote_share_percent"] = predicted_votes[i].vote_share_percent
        params_hash["party_#{i+1}_votes_behind"] = nil
        params_hash["party_#{i+1}_vote_share_percent_behind"] = predicted_votes[0].vote_share_percent - predicted_votes[i].vote_share_percent
      end
    end

    ConstituencyElectionPartyRank.create!(params_hash)
  end
end


ConstituencyElection.all.each do |election|
  create_election_result_rank(election)

  election.predictions.each { |prediction| create_election_prediction_rank(prediction) }
end
