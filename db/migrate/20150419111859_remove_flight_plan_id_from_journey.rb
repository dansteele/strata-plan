class RemoveFlightPlanIdFromJourney < ActiveRecord::Migration
  def change
    remove_column :journeys, :flight_plan_id, :integer
  end
end
