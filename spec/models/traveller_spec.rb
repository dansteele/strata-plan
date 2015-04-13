require 'rails_helper'

RSpec.describe Traveller, type: :model do
  
  describe "travellers have journeys" do

    before do
      @traveller = FactoryGirl::create(:traveller)
      @traveller.journeys.create(name: "Trip to Spain")
      @traveller.journeys << Journey.new(name: "Honeymoon")
    end

    it "should have multiple journeys" do
      expect(@traveller.journeys.count).to eq 2
      expect(@traveller.journeys.second.name).to eq "Honeymoon" 
    end

  end


end
