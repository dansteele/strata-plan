class Waypoint < ActiveRecord::Base

  belongs_to :journey
  acts_as_list scope: :journey

  reverse_geocoded_by :longitude, :latitude do |obj,results|
    if geo = results.first
      obj.name    = [geo.street_address, geo.city].join(", ")
    end
  end

  after_validation :check_if_needs_to_geocode

  private

  def check_if_needs_to_geocode
    reverse_geocode if name == nil
  end

end
