# Product.create(title: "Kindle", price: 200.00, description: "ereader that's awesome", img_url: 'http://goodereader.s3.amazonaws.com/blog/uploads/images/61ir9VrJgZL._SL1000_-300x300.jpg')
# Product.create(title: "Kindle2", price: 300.00, description: "ereader that's really awesome", img_url: 'http://babyboomerconcerns.com/wp-content/uploads/2015/09/kindle-300x300.jpg')
# Product.create(title: "Kindle3", price: 400.00, description: "ereader that'll blow you away", img_url: 'http://babyboomerconcerns.com/wp-content/uploads/2015/09/kindle-300x300.jpg')
# Product.create(title: "Kindle7", price: 2000.00, description: "ereader that is actually desktop computer", img_url: 'http://computerbrands.com/wp-content/uploads/2015/04/cheap-hp-desktop-computers-300x300.jpg')

5.times { 
	Product.create(
		title: Faker::Commerce.product_name, 
		price: Faker::Commerce.price, 
		description: Faker::Hipster.sentence, 
		img_url: Faker::Avatar.image("shop-image", "300x300"), 
		quantity: rand(1..1000) ) 
}

