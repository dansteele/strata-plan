class AddLatitudeAndLongitudeToWaypoint < ActiveRecord::Migration
  def change
    add_column :waypoints, :latitude, :float
    add_column :waypoints, :longitude, :float
  end
end
