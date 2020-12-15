FactoryBot.define do
  factory :item do
    name             { Faker::Name.initials }
    explain          { 'いいものです' }
    category_id      { 2 }
    status_id        { 2 }
    delivery_fee_id  { 2 }
    prefecture_id    { 2 }
    shipping_date_id { 2 }
    price            { 2000 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
