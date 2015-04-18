class AddTypeToJourney < ActiveRecord::Migration
  def change
    add_column :journeys, :type, :string
  end
end
