class RenameSellerIdColumn < ActiveRecord::Migration
  def change
  	rename_column :products, :seller_id, :user_id
  end
end
