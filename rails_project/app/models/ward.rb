class Ward < ApplicationRecord
  belongs_to :local_authority

  has_many :constituency_wards
  has_many :constituencies, through: :constituency_wards

  has_many :ward_population_estimates
  alias_method :population_estimates, :ward_population_estimates
end
