class RenameColumn < ActiveRecord::Migration
  def change
  	rename_column :products, :userid, :user_id
  end
end
