class FlightPlan < ActiveRecord::Base

  # after_create do
  #   Resque.new << GeocodeAirportCode.new
  # end

  validates :start_airport, :end_airport, presence: true

  has_one :flight_plan
  belongs_to :start_airport, :foreign_key => 'start_airport_id', :class_name => "Airport"
  belongs_to :end_airport, :foreign_key => 'end_airport_id', :class_name => "Airport"
  # belongs_to :airport, as: :end_airport

  before_validation do
    # self.start = Airport::lng_lat_of_airport self.start_airport
    # self.end = Airport::lng_lat_of_airport self.end_airport
    self.start_airport = Airport.near(([start_city, start_country].join ", "), 100).order("distance").first
    self.end_airport = Airport.near(([end_city, end_country].join ", "), 100).order("distance").first
  end

end
