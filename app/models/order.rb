class Order < ActiveRecord::Base
  belongs_to :users
  has_many :orders_products
  has_many :products, through: :orders_products

end
