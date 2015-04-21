require 'rails_helper'

RSpec.describe JourneyController, type: :controller do


  describe "journey controller" do
    describe "should create a journey from the special method" do
        before do
          sign_in Traveller.create(email: "hello@world.com", 
            password: "12345678", password_confirmation: "12345678")
          MockShortener::mock "Swansea, UK", "swansea"
          MockShortener::mock "Dusseldorf, Germany", "dusseldorf"
        end
  # WebMock does not seem to work with "deep" callbacks - 
  # Flight was creating a flight plan, which was geocoding the start/end airport
      # describe "should create a flight" do
      #   before do
      #     @name = Faker::Lorem.word
      #     post :create, {
      #       "flight"=>
      #       {"name"=>@name,
      #        "passengers"=>"5",
      #        "flight_plan_attributes"=>
      #         {"start_city"=>"Swansea",
      #          "start_country"=>"UK",
      #          "end_city"=>"Dusseldorf",
      #          "end_country"=>"Germany"}},
      #       "commit"=>"Create Flight",
      #       "controller"=>"journey",
      #       "action"=>"create"
      #     }
      #   end
      #   it "should have the same name" do
      #     binding.pry
      #     expect(Flight.last.name).to eq @name
      #   end
      # end

      describe "should create a journey" do
        before do
          @name = Faker::Lorem.word
          post :create, {
            "journey"=>{"name"=>@name},
           "commit"=>"Create Journey",
           "controller"=>"journey",
           "action"=>"create"
          }
        end

        it "should have the same name" do
          expect(Journey.last.name).to eq @name
        end
      end
    end
  end
end
