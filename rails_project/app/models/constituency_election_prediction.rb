class ConstituencyElectionPrediction < ApplicationRecord
  belongs_to :constituency_election

  has_many :constituency_election_predicted_votes
  alias_method :predicted_votes, :constituency_election_predicted_votes

  has_one :constituency_election_party_rank, as: :election_rankable
  alias_method :party_rank, :constituency_election_party_rank
end
