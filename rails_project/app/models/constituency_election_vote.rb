class ConstituencyElectionVote < ApplicationRecord
  belongs_to :election_voteable, :polymorphic => true

  belongs_to :party
end
