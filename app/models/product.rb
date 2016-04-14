class Product < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: true

  has_and_belongs_to_many :categories
  has_and_belongs_to_many :orders

end
