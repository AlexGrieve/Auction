class AddRatingsToUser < ActiveRecord::Migration
  def change
    add_column :users, :ratings, :integer
  end
end
