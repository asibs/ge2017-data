class ConstituencyElectionPredictedVote < ApplicationRecord
  belongs_to :constituency_election_prediction
  belongs_to :party
end
