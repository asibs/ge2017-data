class Constituency < ApplicationRecord
  belongs_to :region

  has_many :constituency_wards
  has_many :wards, through: :constituency_wards

  has_one :constituency_eu_vote
end
