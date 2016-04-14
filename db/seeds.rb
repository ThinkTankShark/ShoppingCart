User.create(username: "tom", email: "tom@tom.com", password: "tomtom")
User.create(username: "tim", email: "tim@tim.com", password: "timtim")

4.times {
  Category.create(
    name: Faker::Commerce.department
  )
}

Category.all.each do |category|
  4.times {
    category.products.create(
    title: Faker::Commerce.product_name,
    price: Faker::Commerce.price,
    description: Faker::Hipster.sentence,
    img_url: Faker::Avatar.image("shop-image", "300x300"),
    quantity: rand(1..1000))
  }
end
