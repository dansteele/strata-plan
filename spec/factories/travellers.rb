FactoryGirl.define do
  factory :traveller do
    email {Faker::Internet.email}
    password Faker::Internet.password
  end

end
