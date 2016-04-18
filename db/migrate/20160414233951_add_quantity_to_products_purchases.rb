class AddQuantityToProductsPurchases < ActiveRecord::Migration
  def change
    add_column :products_purchases, :quantity, :integer
  end
end
