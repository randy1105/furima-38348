FactoryBot.define do
  factory :item do
    product_name                   { Faker::Commerce.product_name }
    product_description            { Faker::Lorem.sentence }
    category_id                    { Faker::Number.between(from: 2, to: 11) }
    status_id                      { Faker::Number.between(from: 2, to: 7) }
    freight_id                     { Faker::Number.between(from: 2, to: 3) }
    shipping_prefecture_id         { Faker::Number.between(from: 2, to: 47) }
    ship_date_id                   { Faker::Number.between(from: 2, to: 4) }
    price                          { Faker::Number.between(from: 300, to: 9999999) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
