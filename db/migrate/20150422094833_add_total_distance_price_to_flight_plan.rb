class AddTotalDistancePriceToFlightPlan < ActiveRecord::Migration
  def change
    add_column :flight_plans, :total_distance, :float
    add_column :flight_plans, :price, :float
  end
end
