class CreateAirports < ActiveRecord::Migration
  def change
    create_table :airports do |t|
      t.string :name
      t.string :city
      t.string :country
      t.string :iata
      t.string :icao
      t.float :latitude
      t.float :longitude
      t.integer :altitude
      t.float :timezone
      t.string :dst
      t.string :timezonedb

      t.timestamps null: false
    end
  end
end
