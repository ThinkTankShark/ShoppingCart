FactoryGirl.define do
  factory :product do
    title Faker::Commerce.product_name
    price Faker::Commerce.price
    description Faker::Hipster.sentence
    img_url Faker::Avatar.image("shop-image", "300x300")
    quantity rand(1..1000)
  end
end
