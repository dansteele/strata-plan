class JourneyController < ApplicationController

  def show
    @journey = Journey.find(params[:id])
    @waypoints = @journey.waypoints
  end

  def index
    @journeys = current_traveller.journeys
  end

  def create
    if current_traveller.journeys << Journey.create(name: "My new journey")
      redirect_to journey_path(current_traveller.journeys.last)
    else
      render text: "Unable to create journey"
    end
  end

end
