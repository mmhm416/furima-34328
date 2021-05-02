FactoryBot.define do
  factory :user do
    nickname              { 'ふりま太郎' }
    email                 { Faker::Internet.free_email }
    password              { 'test1234' }
    password_confirmation { password }
    first_name            { 'ふりま' }
    last_name             { '太郎' }
    first_name_kana       { 'フリマ' }
    last_name_kana        { 'タロウ' }
    birthday              { '1980-5-3' }
  end
end
