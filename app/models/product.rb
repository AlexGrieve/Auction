 class Product < ActiveRecord::Base
	# Set the current price before initial product create
	before_save :set_pricing

	belongs_to :seller, :class_name => 'User', :foreign_key => 'user_id'
	belongs_to :buyer, :class_name => 'User', :foreign_key => 'buyer_id'

	# Method for allowing users to search for products
	def self.search_for(query)
		where('name LIKE :query OR category LIKE :query', query: "%#{query}")
	end

	# Set the pricing features of product implicitly
	def set_pricing
		self.current_price = self.starting_price if self.current_price.nil?
		self.product_is_sold = false if self.product_is_sold.nil?
		self.bids = 0 if self.bids.nil?
		self.auction_is_over = false if self.auction_is_over.nil?
	end
end
