class Waypoint < ActiveRecord::Base
  belongs_to :journey

  reverse_geocoded_by :longitude, :latitude do |obj,results|
    if geo = results.first
      obj.name    = [geo.street_address, geo.city].join(", ")
    end
  end

  after_validation :reverse_geocode

end
