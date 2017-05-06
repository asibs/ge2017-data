class Region < Area
  belongs_to :country

  has_many :constituencies
end
