class Purchase < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :products
  has_many :products_purchases
end
