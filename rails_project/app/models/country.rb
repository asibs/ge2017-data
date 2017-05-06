class Country < ApplicationRecord
  has_many :regions
  has_many :constituencies, through: :regions

  has_many :population_estimates, -> { order(estimate_date: :desc) },  as: :area, class_name: "AreaPopulationEstimate"

  has_one :eu_vote, as: :area, class_name: "AreaEuVote"
end
