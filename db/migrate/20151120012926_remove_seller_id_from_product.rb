class RemoveSellerIdFromProduct < ActiveRecord::Migration
  def change
    remove_column :products, :seller_id, :integer
  end
end
