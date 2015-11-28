class ChangeRatingsAverage < ActiveRecord::Migration
  def change
  	change_column :users, :average_rating, :decimal
  end
end
