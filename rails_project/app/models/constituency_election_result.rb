class ConstituencyElectionResult < ApplicationRecord
  belongs_to :constituency_election

  has_many :constituency_election_candidate_votes
  alias_method :candidate_votes, :constituency_election_candidate_votes

  has_one :constituency_election_party_rank, as: :election_rankable
  alias_method :party_rank, :constituency_election_party_rank
end
