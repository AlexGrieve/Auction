class Review < ActiveRecord::Base

	# Set up review associations
	belongs_to :reviewer, :class_name => 'User', :foreign_key => 'reviewer_id'
	belongs_to :reviewed, :class_name => 'User', :foreign_key => 'reviewed_user_id'

end
