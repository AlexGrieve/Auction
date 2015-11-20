class AddBuyerIdToProducts < ActiveRecord::Migration
  def change
    add_column :products, :buyer_id, :integer
  end
end
