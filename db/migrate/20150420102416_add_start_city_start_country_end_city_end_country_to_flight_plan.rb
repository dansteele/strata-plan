class AddStartCityStartCountryEndCityEndCountryToFlightPlan < ActiveRecord::Migration
  def change
    add_column :flight_plans, :start_city, :string
    add_column :flight_plans, :start_country, :string
    add_column :flight_plans, :end_city, :string
    add_column :flight_plans, :end_country, :string
  end
end
