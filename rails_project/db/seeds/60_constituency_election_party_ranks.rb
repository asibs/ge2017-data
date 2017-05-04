
puts "Creating Contituency Election Party Rankings"

def create_election_result_rank(election)
  candidate_votes = election.candidate_votes.to_a.sort { |a,b| b.votes <=> a.votes }
  if !candidate_votes.empty? then

    params_hash = { constituency_election_id: election.id, prediction: false,
                    description: "#{election.description} Results" }
    (0..4).each do |i|
      if !candidate_votes[i].nil? then
        params_hash["party_#{i+1}_id"] = candidate_votes[i].party.id
        params_hash["party_#{i+1}_votes"] = candidate_votes[i].votes
        params_hash["party_#{i+1}_vote_share_percent"] = candidate_votes[i].vote_share_percent
        params_hash["party_#{i+1}_votes_behind"] = candidate_votes[0].votes - candidate_votes[i].votes
        params_hash["party_#{i+1}_vote_share_percent_behind"] = candidate_votes[0].vote_share_percent - candidate_votes[i].vote_share_percent
      end
    end

    ConstituencyElectionPartyRank.create!(params_hash)
  end
end


def create_election_prediction_rank(prediction)
  predicted_votes = prediction.predicted_votes.to_a.sort { |a,b| b.predicted_vote_share_percent <=> a.predicted_vote_share_percent }
  if !predicted_votes.empty? then

    params_hash = { constituency_election_id: prediction.constituency_election.id, prediction: true,
                    description: "#{prediction.constituency_election.description} #{prediction.prediction_description}" }
    (0..4).each do |i|
      if !predicted_votes[i].nil? then
        params_hash["party_#{i+1}_id"] = predicted_votes[i].party.id
        params_hash["party_#{i+1}_votes"] = nil
        params_hash["party_#{i+1}_vote_share_percent"] = predicted_votes[i].predicted_vote_share_percent
        params_hash["party_#{i+1}_votes_behind"] = nil
        params_hash["party_#{i+1}_vote_share_percent_behind"] = predicted_votes[0].predicted_vote_share_percent - predicted_votes[i].predicted_vote_share_percent
      end
    end

    ConstituencyElectionPartyRank.create!(params_hash)
  end
end


ConstituencyElection.all.each do |election|
  create_election_result_rank(election)

  election.predictions.each { |prediction| create_election_prediction_rank(prediction) }
end
