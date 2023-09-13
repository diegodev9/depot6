FactoryBot.define do
  factory :product do
    title { Faker::Commerce.product_name }
    description { Faker::Lorem.words(number: 30) }
    image_url { "#{Faker::Avatar.image}.jpg" }
    price { rand(0.01..99.99) }
  end
end
