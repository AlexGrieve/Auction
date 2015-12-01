class User < ActiveRecord::Base
	has_secure_password
	#before_save :set_rating, :set_purchases
	mount_uploader :avatar, AvatarUploader

	# Validates the user's password create
	validates :password, length: {minimum: 5}, presence: {on: :create}, on: :create
	validates_confirmation_of :password, on: :create

	# Set up user's associations
	has_many :product
	has_many :reviews, :class_name => 'Review', :foreign_key => 'reviewed_user_id'
	has_many :reviewers, :class_name => 'Review', :foreign_key => 'reviewer_id'

	has_many :purchases, :class_name => 'Product', :foreign_key => 'buyer_id'
	has_many :sales, :class_name => 'Product', :foreign_key => 'user_id'	

	def set_rating
		self.average_rating = 0.0
		self.total_ratings = 0
	end

	def set_purchases
		self.products_sold = 0
		self.products_bought = 0
	end
end
