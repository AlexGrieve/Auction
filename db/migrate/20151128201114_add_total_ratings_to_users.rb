class AddTotalRatingsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :total_ratings, :integer
  end
end
