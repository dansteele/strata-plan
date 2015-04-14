require 'rails_helper'

RSpec.describe Waypoint, type: :model do
  describe "name generation" do

    it "should save a name" do
      @wayp = Waypoint.create(longitude:51.5072, latitude: 0.1275)
      expect(@wayp.name).to_not eq nil
    end

  end
end
