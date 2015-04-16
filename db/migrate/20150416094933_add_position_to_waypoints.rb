class AddPositionToWaypoints < ActiveRecord::Migration
  def change
    add_column :waypoints, :position, :integer
  end
end
