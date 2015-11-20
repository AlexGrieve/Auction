class AddUseridToProducts < ActiveRecord::Migration
  def change
    add_column :products, :userid, :integer
  end
end
