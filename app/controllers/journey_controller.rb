class JourneyController < ApplicationController

  def new
    @journey = Journey.new()
  end

  def show
    @journey = Journey.find(params[:id])
    redirect_to trip_index_path if @journey.traveller != current_traveller
    @waypoints = @journey.waypoints
  end

  def index
    @journeys = current_traveller.journeys.where(type: nil)
  end

  def create
    if current_traveller.journeys << create_from_params
      redirect_to journey_path(current_traveller.journeys.last)
    else
      binding.pry
      render text: "Unable to create journey"
    end
  end

  private
  def allowed_params
    params.permit(journey: [:name], flight: [:name, :passengers, flight_plan_attributes: [:start_city, :end_city, :start_country, :end_country]])
  end

  def create_from_params
    allowed_params.keys[0].titleize.constantize.create(allowed_params.values[0])
  end

end
