class AddNearestAirportToWaypoint < ActiveRecord::Migration
  def change
    add_column :waypoints, :nearest_airport, :string
  end
end
