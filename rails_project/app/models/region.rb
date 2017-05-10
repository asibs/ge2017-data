class Region < Area
  belongs_to :country

  has_many :constituencies

  def area_type
    "Region"
  end
end
