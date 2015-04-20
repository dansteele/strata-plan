module Airport  
  def lng_lat_of_airport iata
    res = HTTParty.get("http://www.airport-data.com/api/ap_info.json?iata=#{iata}")
    [res["longitude"], res["latitude"]].join ","
  end
end