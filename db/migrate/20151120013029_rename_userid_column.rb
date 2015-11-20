class RenameUseridColumn < ActiveRecord::Migration
  def change
  	rename_column :products, :user_id, :seller_id
  end
end
