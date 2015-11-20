class AddMinPriceToProducts < ActiveRecord::Migration
  def change
    add_column :products, :min_price, :decimal
  end
end
