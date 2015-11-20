class Product < ActiveRecord::Base
	# Set the current price before initial product create
	before_save :set_current_price

	belongs_to :seller, :class_name => 'User', :foreign_key => 'user_id'
	belongs_to :buyer, :class_name => 'User', :foreign_key => 'buyer_id'

	# Method for allowing users to search for products
	def self.search_for(query)
		where('name LIKE :query OR category LIKE :query', query: "%#{query}")
		belongs_to :user
	end

	# Set the current price implicitly from the starting price
	def set_current_price
		self.current_price = self.starting_price if self.current_price.nil?
	end
end
