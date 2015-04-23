class AddBearingToFlightPlan < ActiveRecord::Migration
  def change
    add_column :flight_plans, :bearing, :integer
  end
end
