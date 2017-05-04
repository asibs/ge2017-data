class ConstituenciesController < ApplicationController
  def index
    @constituencies = Constituency.all
  end

  def show
    @constituency = Constituency.find_by(id: params[:id])
  end
end
