class State < Area
  has_many :countries

  def name
    id
  end

  def area_type
    "State"
  end
end
