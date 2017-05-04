class ConstituencyElectionPrediction < ApplicationRecord
  belongs_to :constituency_election

  has_many :constituency_election_predicted_votes
  alias_method :predicted_votes, :constituency_election_predicted_votes
end
