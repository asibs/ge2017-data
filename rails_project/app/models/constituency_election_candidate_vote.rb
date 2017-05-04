class ConstituencyElectionCandidateVote < ApplicationRecord
  belongs_to :constituency_election_result
  belongs_to :party
end
