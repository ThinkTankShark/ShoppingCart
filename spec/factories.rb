FactoryGirl.define do
  factory :purchase do
     user_id ([1..100].sample)
     total_cost number_to_currency([1..1000].sample)
  end
  factory :user do
    username "MyString"
    email "MyString"
    password_digest "MyString"
  end
  factory :category do
    name "MyString"
  end
  factory :product do
    title Faker::Commerce.product_name
    price Faker::Commerce.price
    description Faker::Hipster.sentence
    img_url Faker::Avatar.image("shop-image", "300x300")
    quantity ([1..1000].sample)
  end
end

