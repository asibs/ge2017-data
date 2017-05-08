class Area < ApplicationRecord
  self.abstract_class = true

  has_one :eu_vote, as: :area, class_name: "AreaEuVote"

  has_many :population_estimates, -> { order(estimate_date: :desc) }, as: :area, class_name: "AreaPopulationEstimate"

  has_many :unemployment_rates, -> { order(statistic_date: :desc) }, as: :area, class_name: "AreaUnemployment"

  has_many :out_of_work_benefit_rates, -> { order(statistic_date: :desc) }, as: :area, class_name: "AreaOutOfWorkBenefit"

  has_many :median_wages, -> { order(statistic_date: :desc) }, as: :area, class_name: "AreaMedianWage"
end
