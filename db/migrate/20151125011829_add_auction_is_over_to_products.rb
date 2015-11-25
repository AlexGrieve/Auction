class AddAuctionIsOverToProducts < ActiveRecord::Migration
  def change
  	add_column :products, :auction_is_over, :boolean
  end
end
