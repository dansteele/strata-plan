class AddFlightIdToFlightPlan < ActiveRecord::Migration
  def change
    add_column :flight_plans, :flight_id, :integer
  end
end
