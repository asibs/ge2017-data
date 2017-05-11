class LocalAuthority < Area
  belongs_to :region

  has_one :country, through: :region

  def area_type
    "LocalAuthority"
  end
end
