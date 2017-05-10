class Constituency < Area
  belongs_to :region

  has_one :country, through: :region

  has_many :constituency_wards
  has_many :wards, through: :constituency_wards

  has_many :constituency_elections
  alias_method :elections, :constituency_elections

  has_many :elections_with_results, -> { joins(:constituency_election_result).order(election_date: :desc) }, class_name: "ConstituencyElection"

  has_one :constituency_summary
  alias_method :summary, :constituency_summary

  def area_type
    "Constituency"
  end
end
