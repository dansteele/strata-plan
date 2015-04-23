class AddObservationIdToFlightPlan < ActiveRecord::Migration
  def change
    add_column :flight_plans, :observation_id, :integer
  end
end
