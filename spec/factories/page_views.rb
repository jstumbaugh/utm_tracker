FactoryBot.define do
  factory :page_view do
    viewed_at    { DateTime.now }
    utm_source   { Faker::Lorem.word }
    utm_campaign { Faker::Lorem.word }
    utm_medium   { Faker::Lorem.word }
  end
end
