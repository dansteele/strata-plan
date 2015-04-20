class RemoveStartAirportEndAirportFromFlightPlans < ActiveRecord::Migration
  def change
    remove_column :flight_plans, :start_airport, :string
    remove_column :flight_plans, :end_airport, :string
  end
end
