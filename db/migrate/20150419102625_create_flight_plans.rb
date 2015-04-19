class CreateFlightPlans < ActiveRecord::Migration
  def change
    create_table :flight_plans do |t|
      t.point :start
      t.point :end
      t.string :start_airport
      t.string :end_airport

      t.timestamps null: false
    end
  end
end