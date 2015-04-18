class FlightsController < ApplicationController

  def index
    @flights = current_traveller.flights
  end

  def new
    @flight = Flight.new
  end

end