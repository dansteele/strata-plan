class FlightPlan < ActiveRecord::Base

  # after_create do
  #   Resque.new << GeocodeAirportCode.new
  # end

  before_save do
    # self.start = Airport::lng_lat_of_airport self.start_airport
    # self.end = Airport::lng_lat_of_airport self.end_airport
  end

end
