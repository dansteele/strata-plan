class RemoveStartAirportFromJourneys < ActiveRecord::Migration
  def change
    remove_column :journeys, :start_airport, :string
  end
end
