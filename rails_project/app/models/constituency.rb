class Constituency < ApplicationRecord
  belongs_to :region

  has_one :country, through: :region

  has_many :constituency_wards
  has_many :wards, through: :constituency_wards

  has_many :constituency_population_estimates
  alias_method :population_estimates, :constituency_population_estimates

  has_many :constituency_elections
  alias_method :elections, :constituency_elections

  has_many :constituency_election_candidate_votes, through: :constituency_elections
  alias_method :election_candidate_votes, :constituency_election_candidate_votes

  has_one :constituency_eu_vote
  alias_method :eu_vote, :constituency_eu_vote

end
