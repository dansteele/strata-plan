class AddPassengersToJourney < ActiveRecord::Migration
  def change
    add_column :journeys, :passengers, :integer
  end
end
