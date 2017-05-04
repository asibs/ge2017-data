class ConstituencyElectionResult < ApplicationRecord
  belongs_to :constituency_election

  has_many :constituency_election_candidate_votes
  alias_method :candidate_votes, :constituency_election_candidate_votes
end
