class AddCompositeIndexCategoriesProducts < ActiveRecord::Migration
  def change
    add_index :categories_products, [ :category_id, :product_id ], unique: true, name: 'by_category_and_product'
  end
end
