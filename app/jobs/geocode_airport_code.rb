class GeocodeAirportCode
  @queue = :geocode_airport

  def work flight_plan
    HTTParty.get("http://www.airport-data.com/api/ap_info.json?iata=LHR")
  end
end