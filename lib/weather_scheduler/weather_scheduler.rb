require 'rufus-scheduler'
require "geocoder"

module Geocoder
  module Calculations  
    COMPASS_POINTS = %w[N NNE NE ENE E ESE SE SSE S SSW SW WSW W WNW NW NNW] 

    def cp_to_degrees cp
      (360/COMPASS_POINTS.length) * (COMPASS_POINTS.index(cp) + 1)
    end   
  end  
end  


scheduler = Rufus::Scheduler.new


scheduler.every '30m' do
  res = HTTParty.get("http://datapoint.metoffice.gov.uk/public/data/" \
  "val/wxobs/all/json/all?res=hourly&key=e3c245e1-ec02-422a-a9f7-16dbc46ee0bb")

  res["SiteRep"]["DV"]["Location"].each_with_index do |loc, i|
    next unless loc["Period"].class == Array
    @rep = loc["Period"].first["Rep"].first
    unless @rep.class == Fixnum || @rep["D"].nil? || @rep["S"].nil? || @rep["P"].nil?
      unless @rep["D"].length == 0 || @rep["S"].length == 0 || @rep["P"].length == 0
        @obs = Observation.find_or_create_by(id: loc["i"])
        @obs.longitude = loc["lon"]
        @obs.latitude = loc["lat"]
        @obs.name = loc["name"]
        @obs.country = loc["country"]
        @obs.wind_direction = Geocoder::Calculations.cp_to_degrees(@rep["D"])
        @obs.wind_speed = loc["Period"].first["Rep"].first["S"].to_i
        @obs.pressure = loc["Period"].first["Rep"].first["P"]
        @obs.save
      end
    end
  end
  puts "Weather synched at #{Time.now}"
end

scheduler.join