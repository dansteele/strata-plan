require 'rails_helper'

RSpec.describe Waypoint, type: :model do
  describe "name generation" do

    it "should save a name" do
      @journey = Journey.create!(name: "test")
      WebMock::stub_request(:get, "https://maps.googleapis.com/maps/api/geocode/json?key=AIzaSyBwGmEeg9OKIjaWiPE5-GnPR75Y1KXm14g&language=en&latlng=51.5072,0.1275&sensor=false").
         with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
         to_return(:status => 200, :body => File.read("spec/stubs/waypoint_geocode.json"), :headers => {})
      @journey.waypoints << Waypoint.new(longitude:51.5072, latitude: 0.1275)
      @journey.save!

      expect(@journey.waypoints.last.name).to eq "Crossway, London"
    end

  end
end
