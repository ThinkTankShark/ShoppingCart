User.create(username: "tom", email: "tom@tom.com", password: "tomtom")
User.create(username: "tim", email: "tim@tim.com", password: "timtim")

5.times { Category.create(name: Faker::Commerce.department) }
3.times {
	Product.create(
		title: Faker::Commerce.product_name,
		price: Faker::Commerce.price,
		description: Faker::Hipster.sentence,
		img_url: Faker::Avatar.image("shop-image", "300x300"),
		quantity: rand(1..1000)
}

