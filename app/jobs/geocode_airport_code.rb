class GeocodeAirportCode
  @queue = :geocode_airport

  def work flight_plan
    response = HTTParty.get("http://www.airport-data.com/api/ap_info.json?iata=LHR")
    binding.pry
  end
end