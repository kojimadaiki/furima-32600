FactoryBot.define do
  factory :user do
    name                  { Faker::Name.initials }
    email                 { Faker::Internet.free_email }
    password              { 'aaa1aaa' }
    password_confirmation { password }
    full_firstname        { '山田' }
    full_lastname         { '太郎' }
    kana_firstname        { 'ヤマダ' }
    kana_lastname         { 'タロウ' }
    birth_date            { '2000-01-01' }
  end
end
