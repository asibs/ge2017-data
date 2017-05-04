class ConstituencyElection < ApplicationRecord
  belongs_to :constituency

  has_one :constituency_election_result
  alias_method :result, :constituency_election_result

  has_many :constituency_election_candidate_votes, through: :constituency_election_result
  alias_method :candidate_votes, :constituency_election_candidate_votes

  has_many :constituency_election_predictions
  alias_method :predictions, :constituency_election_predictions

  def description
    [election_type, election_sub_type, election_date].join(" ").gsub(/\s+/, " ")
  end
end
