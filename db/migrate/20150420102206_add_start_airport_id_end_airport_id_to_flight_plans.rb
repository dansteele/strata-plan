class AddStartAirportIdEndAirportIdToFlightPlans < ActiveRecord::Migration
  def change
    add_column :flight_plans, :start_airport_id, :integer
    add_column :flight_plans, :end_airport_id, :integer
  end
end
