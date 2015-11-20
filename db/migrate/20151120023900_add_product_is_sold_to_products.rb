class AddProductIsSoldToProducts < ActiveRecord::Migration
  def change
    add_column :products, :product_is_sold, :boolean
  end
end
