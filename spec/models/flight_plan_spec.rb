require 'rails_helper'

RSpec.describe FlightPlan, type: :model do
  describe "relationships" do
    before do
      @flight = Flight.create(name: "test")
      @flight.update(flight_plan: FlightPlan.create(start: "-0.5,51.123154"))
      @flight.reload
    end


    it "should be part of a flight" do
      expect(@flight.flight_plan.start).to_not be nil
    end

    it "should find the nearest airport" do
      expect(@flight.flight_plan.start_airport).to eq "Heathrow"
    end


  end
end
