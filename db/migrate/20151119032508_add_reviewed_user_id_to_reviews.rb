class AddReviewedUserIdToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :reviewed_user_id, :integer
  end
end
