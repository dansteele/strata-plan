require 'rails_helper'

RSpec.describe FlightPlan, type: :model do
  describe "test associations" do
    before do
      @flight = Flight.create(name: "test")
      @flight.flight_plan.start = [Factorygirl::create(:waypoint).longitude, Factorygirl::create(:waypoint).latitude].join ","
    end


    it "should be part of a flight" do
      expect(@flight.flight_plan.start).to_not be nil
    end
  end
end
