require 'rails_helper'

RSpec.describe FlightPlan, type: :model do
  describe "relationships" do
    before do
      # require "./db/seeds"
      require "lib/modules/mock_shortener_module"
      MockShortener::mock "Hayes, UK", "flight_start_geocode"
      MockShortener::mock "Dusseldorf, Germany", "flight_end_geocode"

      @flight = Flight.create!(name: "test", passengers: 2)
      Airport.create!(name: "Heathrow", longitude: -0.5, latitude: 51.123)
      Airport.create!(name: "Dusseldorf", longitude: 6.766667, latitude: 51.289444)
      @flight.update!(flight_plan: FlightPlan.create(start_city: "Hayes", start_country: "UK",
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

    it "should add the start and end points as waypoints" do
      expect(@flight.waypoints.count).to be 2
      expect(@flight.waypoints.second.name).to eq "Dusseldorf"
      expect(@flight.waypoints.second.latitude).to eq 6.766667
    end

    it "should save the total distance between the airports" do
      expect(@flight.flight_plan.total_distance).to be_within(10).of(310)
    end

    it "should save the price of the flight" do
      expect(@flight.flight_plan.price).to be_within(50).of(300)
    end

    it "should have a weather observation" do
      expect(@flight.flight_plan.nearest_observation).to_not be nil
    end

    after do
      DatabaseCleaner.clean
    end

  end
  describe "calc price of a different flight" do
    before do
      MockShortener::mock "New York City, US", "jfk"
      @flight = Flight.create!(name: "test 2", passengers: 2)
      Airport.create!(name: "Heathrow", longitude: -0.5, latitude: 51.123)
      Airport.create!(name: "New York", longitude: -74, latitude: 40)
      @flight.update!(flight_plan: FlightPlan.create(start_city: "Hayes", start_country: "UK",
      end_city: "New York City", end_country: "US"   ))
      @flight.reload
    end

    it "should save the right price of a different flight" do
      expect(@flight.flight_plan.price).to be_within(100).of(1000)
    end

    after do
      DatabaseCleaner.clean
    end
  end


end
