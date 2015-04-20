require 'rails_helper'

RSpec.describe FlightPlan, type: :model do
  describe "relationships" do
    before do
      @flight = Flight.create(name: "test")
      Airport.create(name: "Heathrow", longitude: -0.5, latitude: 51.123)
      Airport.create(name: "Somewhere else", longitude: 23, latitude: 32)
      @flight.update(flight_plan: FlightPlan.create(start_city: "Hayes", start_country: "UK",
      end_city: "London", end_country: "UK"   ))
      @flight.reload
    end

    it "should be part of a flight" do
      expect(@flight.flight_plan).to_not be nil
    end

    it "should find the nearest airport" do
      expect(@flight.flight_plan.start_airport.name).to eq "Heathrow"
    end

  end
end
