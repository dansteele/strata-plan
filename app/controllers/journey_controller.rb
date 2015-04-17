class JourneyController < ApplicationController

  def new
    @journey = Journey.new()
  end

  def show
    @journey = Journey.find(params[:id])
    @waypoints = @journey.waypoints
  end

  def index
    @journeys = current_traveller.journeys
  end

  def create
    if current_traveller.journeys << Journey.create(allowed_params)
      redirect_to journey_path(current_traveller.journeys.last)
    else
      render text: "Unable to create journey"
    end
  end

  private
  def allowed_params
    params.require(:journey).permit(:name)
  end

end
