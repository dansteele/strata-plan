class AddWindSpeedToObservations < ActiveRecord::Migration
  def change
    add_column :observations, :wind_speed, :integer
  end
end
