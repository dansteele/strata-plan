class FlightPlan < ActiveRecord::Base

  # after_create do
  #   Resque.new << GeocodeAirportCode.new
  # end

  validates :start_airport, :end_airport, presence: true

  belongs_to :flight
  belongs_to :start_airport, :foreign_key => 'start_airport_id', :class_name => "Airport"
  belongs_to :end_airport, :foreign_key => 'end_airport_id', :class_name => "Airport"
  # belongs_to :airport, as: :end_airport

  before_validation do
    # self.start = Airport::lng_lat_of_airport self.start_airport
    # self.end = Airport::lng_lat_of_airport self.end_airport
    self.start_airport = find_nearest_airport start_city, start_country
    self.end_airport = find_nearest_airport end_city, end_country
  end

  before_save do
    if self.flight && self.flight.waypoints.count < 2
      self.flight.waypoints << create_wp(start_airport)
      self.flight.waypoints << create_wp(end_airport)
    end
    self.total_distance = calc_distance
  end

  private
  def find_nearest_airport city, country
    Airport.near(([city, country].join ", "), 100).order("distance").first
  end

  def create_wp airport
    Waypoint.create(name: airport.name, 
    latitude: airport.latitude, longitude: airport.longitude)
  end

  def calc_distance
    self.start_airport.distance_to self.end_airport
  end
end
