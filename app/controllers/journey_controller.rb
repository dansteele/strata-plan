class JourneyController < ApplicationController

  def index
    @journeys = current_traveller.journeys
  end

end
