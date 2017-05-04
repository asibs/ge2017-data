class WardPopulationEstimate < ApplicationRecord
  include PopulationEstimate

  belongs_to :ward
end
