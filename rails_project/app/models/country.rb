class Country < Area
  belongs_to :state
  has_many :regions
  has_many :constituencies, through: :regions

  def name
    id
  end

  def area_type
    "Country"
  end
end
