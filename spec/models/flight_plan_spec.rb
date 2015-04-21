require 'rails_helper'

RSpec.describe FlightPlan, type: :model do
  describe "relationships" do
    before do
      # WebMock.allow_net_connect!
      require "stubs/mock_shortener_module.rb"
      MockShortener::mock "Hayes, UK", "flight_start_geocode"
      MockShortener::mock "Dusseldorf, Germany", "flight_end_geocode"

      @flight = Flight.create(name: "test")
      Airport.create(name: "Heathrow", longitude: -0.5, latitude: 51.123)
      Airport.create(name: "Dusseldorf", longitude: 6.766667, latitude: 51.289444)
      @flight.update(flight_plan: FlightPlan.create(start_city: "Hayes", start_country: "UK",
      end_city: "Dusseldorf", end_country: "Germany"   ))
      @flight.reload
    end

    it "should be part of a flight" do
      expect(@flight.flight_plan).to_not be nil
    end

    it "should find the nearest airport" do
      expect(@flight.flight_plan.start_airport.name).to eq "Heathrow"
      expect(@flight.flight_plan.end_airport.name).to eq "Dusseldorf"
    end

    it "should find the distance between the airports" do
      expect(
        @flight.flight_plan.start_airport.distance_to @flight.flight_plan.end_airport
      ).to be_within(10).of(310)
    end

  end
end
