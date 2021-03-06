FactoryBot.define do
  factory :item do
    item_name { Faker::Internet.user_name }
    explanation      { Faker::Lorem.sentence }
    category_id      { 2 }
    condition_id      { 2 }
    delivery_cost_id  { 2 }
    prefecture_id     { 2 }
    delivery_time_id  { 2 }
    price { 30_000 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
