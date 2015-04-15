FactoryGirl.define do
  factory :waypoint do
    longitude Faker::Address.longitude
    latitude Faker::Address.latitude
  end

end
