# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
def parse file_path
  data = SmarterCSV.process(file_path)
  data.each do |d|
    Airport.create(d)
  end
end

unless Rails.env.test?
  Airport.transaction do
    parse "lib/data/airports.csv"
  end
end

require "geocoder"

module Geocoder
  module Calculations  
    COMPASS_POINTS = %w[N NNE NE ENE E ESE SE SSE S SSW SW WSW W WNW NW NNW] 

    def cp_to_degrees cp
      (360/COMPASS_POINTS.length) * (COMPASS_POINTS.index(cp) + 1)
    end   
  end  
end  

WebMock.allow_net_connect! if Rails.env.test?
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