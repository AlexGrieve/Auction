class AddBidsToProducts < ActiveRecord::Migration
  def change
    add_column :products, :bids, :integer
  end
end
