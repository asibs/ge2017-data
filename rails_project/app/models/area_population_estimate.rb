class AreaPopulationEstimate < ApplicationRecord
  include PopulationEstimate

  belongs_to :area, polymorphic: true
end
