class FlightsController < ApplicationController

  def index
    @flights = current_traveller.flights
  end

end