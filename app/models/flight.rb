class Flight < Journey

  has_one :flight_plan

  def notify_waypoint_create waypoint
    self.flight_plan.end = [waypoint.longitude, waypoint.latitude].join ","
  end

end
