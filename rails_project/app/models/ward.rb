class Ward < Area
  belongs_to :local_authority

  has_many :constituency_wards
  has_many :constituencies, through: :constituency_wards

  def area_type
    "Ward"
  end
end
