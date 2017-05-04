class CountryPopulationEstimate < ApplicationRecord
  include PopulationEstimate

  belongs_to :country
end
