class ProductsPurchases < ActiveRecord::Migration
  def change
    create_join_table :products, :purchases
  end
end
