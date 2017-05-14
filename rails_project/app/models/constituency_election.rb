class ConstituencyElection < ApplicationRecord
  belongs_to :constituency

  has_one :constituency_election_result
  alias_method :result, :constituency_election_result

  has_many :constituency_election_actual_votes, through: :constituency_election_result, source: :constituency_election_votes
  alias_method :actual_votes, :constituency_election_actual_votes
  alias_method :votes, :constituency_election_actual_votes

  has_many :constituency_election_predictions
  alias_method :predictions, :constituency_election_predictions

  def description
    [election_type, election_sub_type, election_date].join(" ").gsub(/\s+/, " ")
  end

  def turnout_percent
    return nil if (total_valid_votes_counted.nil? || electorate_size.nil?)
    (total_valid_votes_counted.to_f / electorate_size) * 100
  end

  def postal_percent
    return nil if (valid_postal_votes_counted.nil? || electorate_size.nil?)
    (valid_postal_votes_counted.to_f / electorate_size) * 100
  end
end
