class RemoveUseridFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :userid, :integer
  end
end
