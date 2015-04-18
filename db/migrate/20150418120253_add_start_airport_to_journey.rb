class AddStartAirportToJourney < ActiveRecord::Migration
  def change
    add_column :journeys, :start_airport, :string
  end
end
