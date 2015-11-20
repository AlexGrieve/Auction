class AddAverageRatingsToUser < ActiveRecord::Migration
  def change
    add_column :users, :average_rating, :integer
  end
end
