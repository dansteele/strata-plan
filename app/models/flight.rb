class Flight < Journey

  has_one :flight_plan
  accepts_nested_attributes_for :flight_plan

end
