require 'rails_helper'

RSpec.describe Waypoint, type: :model do
  describe "name generation" do

    it "should save a name" do
      @journey = Journey.create!(name: "test")
      @journey.waypoints << Waypoint.new(longitude:51.5072, latitude: 0.1275)
      @journey.save!

      expect(@journey.waypoints.last.name).to eq "Crossway, London"
    end

  end
end
