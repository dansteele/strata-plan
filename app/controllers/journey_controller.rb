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
    if current_traveller.journeys << create_from_params
      redirect_to journey_path(current_traveller.journeys.last)
    else
      render text: "Unable to create journey"
    end
  end

  private
  def allowed_params
    params.permit(journey: [:name], flight: [:name, :passengers])
  end

  def create_from_params
    allowed_params.keys[0].titleize.constantize.create(allowed_params.values[0]
)
  end

end
