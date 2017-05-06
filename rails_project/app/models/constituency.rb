class Constituency < ApplicationRecord
  belongs_to :region

  has_one :country, through: :region

  has_many :constituency_wards
  has_many :wards, through: :constituency_wards

  has_many :population_estimates, -> { order(estimate_date: :desc) }, as: :area, class_name: "AreaPopulationEstimate"

  has_many :constituency_elections
  alias_method :elections, :constituency_elections

  has_many :elections_with_results, -> { joins(:constituency_election_result).order(election_date: :desc) }, class_name: "ConstituencyElection"

#  has_many :constituency_election_votes, through: :constituency_elections
#  alias_method :election_votes, :constituency_election_votes

  has_one :constituency_eu_vote
  alias_method :eu_vote, :constituency_eu_vote

end
