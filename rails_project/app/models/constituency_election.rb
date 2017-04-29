class ConstituencyElection < ApplicationRecord
  belongs_to :constituency

  has_many :constituency_election_candidate_votes

  has_many :constituency_election_predictions
end
