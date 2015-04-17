class WaypointsController < ApplicationController

  def destroy
    Waypoint.find(params[:id]).destroy
    render nothing: true
  end

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
