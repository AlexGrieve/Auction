class User < ActiveRecord::Base
	has_secure_password

	# Validates the user's password create
	validates :password, length: {minimum: 5}, presence: {on: :create}
	validates_confirmation_of :password

	# Set up user's associations
	has_many :product
	has_many :reviews, :class_name => 'Review', :foreign_key => 'reviewed_user_id'
	has_many :reviewers, :class_name => 'Review', :foreign_key => 'reviewer_id'

	has_many :purchases, :class_name => 'Product', :foreign_key => 'buyer_id'
	has_many :sales, :class_name => 'Product', :foreign_key => 'user_id'	
end
