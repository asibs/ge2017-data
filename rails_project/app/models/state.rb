class State < Area
  has_many :countries

  def area_type
    "State"
  end
end
