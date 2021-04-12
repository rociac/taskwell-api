FactoryBot.define do
  factory :project do
    name { Faker::App.name }
    project_type { 'software' }
    description { Faker::Lorem.sentences }
    live_link { Faker::Internet.url }
    user_id { nil }
  end
end