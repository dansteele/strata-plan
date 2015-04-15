class WaypointsController < ApplicationController

  def create
    @journey = Journey.find(params[:journey]) 
    @journey.waypoints << Waypoint.create(
      latitude: params[:latitude],
      longitude: params[:longitude]
    )
    @waypoints = @journey.waypoints
    render @waypoints
  end

  private
  def allowed_params
    params.require(:waypoint).permit(:latitude, :logitude)
  end

end
