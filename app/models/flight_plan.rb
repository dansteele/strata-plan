class FlightPlan < ActiveRecord::Base

  # after_create do
  #   Resque.new << GeocodeAirportCode.new
  # end

  validates :start_airport, :end_airport, presence: true

  belongs_to :flight
  belongs_to :nearest_observation, :foreign_key => 'observation_id', :class_name => "Observation"
  belongs_to :start_airport, :foreign_key => 'start_airport_id', :class_name => "Airport"
  belongs_to :end_airport, :foreign_key => 'end_airport_id', :class_name => "Airport"

  before_validation do
    self.start_airport = find_nearest_airport start_city, start_country
    self.end_airport = find_nearest_airport end_city, end_country
  end

  before_save do
    if self.flight
      self.price = calc_price
      if self.flight && self.flight.waypoints.count < 2
        self.flight.waypoints << create_wp(start_airport)
        self.flight.waypoints << create_wp(end_airport)
      end
      self.nearest_observation = find_nearest_observation
      self.bearing = find_bearing
    end
    self.total_distance = calc_distance
  end

  def get_headwind
    (Math.cos(get_heading_difference) * self.nearest_observation.wind_speed).round
  end

  private
  def find_nearest_airport city, country
    Airport.near(([city, country].join ", "), 500).order("distance").first
  end

  def create_wp airport
    Waypoint.create(name: airport.name, 
    latitude: airport.longitude, longitude: airport.latitude)
  end

  def calc_distance
    (self.start_airport.distance_to self.end_airport).round(0)
  end

  def calc_price
    ((self.flight.passengers) * (5 * (Math.sqrt(calc_distance*2) + 8))).round(2)
  end

  def find_nearest_observation
    Observation.near(self.start_airport, 100).order("distance").first
  end

  def find_bearing
    self.start_airport.bearing_to(self.end_airport)
  end

  def get_heading_difference
    heading_difference = (self.bearing - self.nearest_observation.wind_direction).abs
    heading_difference = heading_difference * (Math::PI / 180)
  end


end
