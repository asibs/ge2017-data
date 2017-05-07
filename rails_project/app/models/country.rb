class Country < Area
  belongs_to :state
  has_many :regions
  has_many :constituencies, through: :regions
end
