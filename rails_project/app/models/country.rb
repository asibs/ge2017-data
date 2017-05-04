class Country < ApplicationRecord
  has_many :regions
  has_many :constituencies, through: :regions

  has_many :country_population_estimates
  alias_method :population_estimates, :country_population_estimates
end
