class Ward < ApplicationRecord
  belongs_to :local_authority

  has_many :constituency_wards
  has_many :constituencies, through: :constituency_wards

  has_many :population_estimates, -> { order(estimate_date: :desc) }, as: :area, class_name: "AreaPopulationEstimate"
end
