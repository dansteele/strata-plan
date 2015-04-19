class RemoveNearestAirportFromWaypoints < ActiveRecord::Migration
  def change
    remove_column :waypoints, :nearest_airport, :string
  end
end
