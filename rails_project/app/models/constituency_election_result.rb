class ConstituencyElectionResult < ApplicationRecord
  belongs_to :constituency_election

  has_many :constituency_election_votes, as: :election_voteable
  alias_method :actual_votes, :constituency_election_votes
  alias_method :votes, :constituency_election_votes

  has_one :constituency_election_party_rank, as: :election_rankable
  alias_method :party_rank, :constituency_election_party_rank
end
