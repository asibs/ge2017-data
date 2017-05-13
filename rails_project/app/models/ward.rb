class Ward < Area
  belongs_to :local_authority

  has_one :region, through: :local_authority

  has_one :country, through: :region

  has_one :state, through: :country

  has_many :constituency_wards
  has_many :constituencies, through: :constituency_wards

  def area_type
    "Ward"
  end
end
