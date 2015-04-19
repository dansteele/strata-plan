class AddFlightPlanIdToJourney < ActiveRecord::Migration
  def change
    add_column :journeys, :flight_plan_id, :integer
  end
end
