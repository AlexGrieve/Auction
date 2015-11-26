# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

reviews = Review.create([
	{
		review: "The seller was not so great!",
		reviewer_id: 1,
		reviewed_user_id: 2
	}
	{
		review: "The seller was awesome!",
		reviewer_id: 2,
		reviewed_user_id: 1
	}
])

products = Product.create([
	{
		name: "Coffee mug"
		description: "Black coffee mug of an average size"
		category: "Office Supplies"
		starting_price: 3.99
		buy_now_price: 5.00
		current_price: 3.99
		start_date: "2015-11-23"
		end_date: "2015-12-12"
		user_id: 1
	}



	])