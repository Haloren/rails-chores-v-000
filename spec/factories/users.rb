FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    house_id { Faker::Internet.house_id}
  end
end
