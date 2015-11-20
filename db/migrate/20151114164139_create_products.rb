class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.string :category
      t.decimal :starting_price
      t.decimal :buy_now_price
      t.decimal :current_price
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps null: false
    end
  end
end
