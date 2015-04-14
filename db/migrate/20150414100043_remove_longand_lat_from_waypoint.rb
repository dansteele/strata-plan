class RemoveLongandLatFromWaypoint < ActiveRecord::Migration
  def change
    remove_column :waypoints, :long, :string
    remove_column :waypoints, :lat, :string
  end
end
