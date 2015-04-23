class CreateObservations < ActiveRecord::Migration
  def change
    create_table :observations do |t|
      t.string :name
      t.string :country
      t.integer :wind_direction
      t.integer :pressure
      t.float :longitude
      t.float :latitude

      t.timestamps null: false
    end
  end
end
