FactoryBot.define do
  factory :purchase_delivery do
    zip_code          { '123-4567' }
    prefecture_id     { 2 }
    city              { Faker::Address.city }
    address           { Faker::Address.secondary_address }
    building          { Faker::Address.building_number }
    phone_no          { '09012345678' }
    token             { 'tok_abcdefghijk00000000000000000' }
  end
end
