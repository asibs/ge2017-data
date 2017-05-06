class Country < Area
  has_many :regions
  has_many :constituencies, through: :regions
end
