class CreateWaypoints < ActiveRecord::Migration
  def change
    create_table :waypoints do |t|
      t.integer :journey_id
      t.string :name
      t.string :long
      t.string :lat

      t.timestamps null: false
    end
  end
end
