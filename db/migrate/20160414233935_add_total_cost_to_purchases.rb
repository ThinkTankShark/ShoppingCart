class AddTotalCostToPurchases < ActiveRecord::Migration
  def change
    add_column :purchases, :total_cost, :decimal
  end
end
