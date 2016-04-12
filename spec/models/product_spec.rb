require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:product_no_title) {Product.new(description: "This is a test product", price: 5.00)}
  let(:product_no_description) {Product.new(title: "Undescribed product", price: 5.00)}
  let(:product_no_price) {Product.new(title: "Priceless", description: "Can't put a price on this")}
  let(:product_letter_price) {Product.new(title: "Priceless", description: "Can't put a price on this", price: "hello")}
  let(:good_product) {Product.new(title: "Good product", description: "Affordable product", price: 1.05)}
  describe 'validations' do
    context 'will raise an error' do
      it 'when the title field is empty' do
        product_no_title.save
        expect(product_no_title.errors[:title]).to include("can't be blank")
      end
      it 'when the description field is empty' do
        product_no_description.save
        expect(product_no_description.errors[:description]).to include("can't be blank")
      end
      it 'when the price field is empty' do
        product_no_price.save
        expect(product_no_price.errors[:price]).to include("can't be blank")
      end
      it 'when the price is not a number value' do
        product_letter_price.save
        expect(product_letter_price.errors[:price]).to include("is not a number")
      end
    end
    context 'will save a valid product' do
      it 'saves a product when the fields are filled out correctly' do
        expect {good_product.save}.to change {Product.count}.by(1)
      end
    end
  end
end
