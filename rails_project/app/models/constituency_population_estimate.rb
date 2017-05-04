class ConstituencyPopulationEstimate < ApplicationRecord
  include PopulationEstimate

  belongs_to :constituency
end
