class Waypoint < ActiveRecord::Base

  belongs_to :journey
  acts_as_list scope: :journey

  after_create do
    notify_observers_of_create
  end

  reverse_geocoded_by :longitude, :latitude do |obj,results|
    if geo = results.first
      obj.name    = [geo.street_address, geo.city].join(", ")
    end
  end

  after_validation :reverse_geocode

  private
  def find_nearest_airport
    "Heathrow"
  end

  def notify_observers_of_create
    self.flight.notify_waypoint_create(self) if self.journey.type == "flight"
  end

end
