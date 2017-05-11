class ConstituenciesController < ApplicationController
  def index
    @constituencies = Constituency.includes(:area_summary, most_recent_election_result: :constituency_election_summary).all
  end

  def show
    @constituency = Constituency.find_by(id: params[:id])
  end
end
