require 'rails_helper'

RSpec.describe FlightPlan, type: :model do
  describe "relationships" do
    before do
      # WebMock.allow_net_connect!
      WebMock::stub_request(:get, "https://maps.googleapis.com/maps/api/geocode/json?address=Hayes,%20UK&key=AIzaSyBwGmEeg9OKIjaWiPE5-GnPR75Y1KXm14g&language=en&sensor=false").
         with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
         to_return(:status => 200, :body => File.read("spec/stubs/flight_start_geocode.json"), :headers => {})

      WebMock::stub_request(:get, "https://maps.googleapis.com/maps/api/geocode/json?address=Dusseldorf,%20Germany&key=AIzaSyBwGmEeg9OKIjaWiPE5-GnPR75Y1KXm14g&language=en&sensor=false").
         with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
         to_return(:status => 200, :body => File.read("spec/stubs/flight_end_geocode.json"), :headers => {})

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
