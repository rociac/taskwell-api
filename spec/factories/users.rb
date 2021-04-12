FactoryBot.define do
  factory :user do
    username { Faker::Internet.username }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    site_url { Faker::Internet.domain_name }
    email { Faker::Internet.safe_email }
    password { Faker::Internet.password }
  end
end