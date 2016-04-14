require 'rails_helper'


RSpec.feature "Products", js: true do


  let(:new_category) { FactoryGirl.create(:category) }



  describe 'filling out a form' do
    it 'can create a new product and see it rendered on the page' do

    end
  end

  describe 'editing an existing product' do
    it 'can fill out the form of the product page and see updated result' do
      visit edit_product_path(new_product.id)
      title = "edit title"
      fill_in 'Title', with: title
      price = 36.00
      fill_in 'Price', with: price
      body = "Here is edit text"
      fill_in 'Description', with: body
      click_button 'Update Product'
      expect(page).to have_content(title)
    end
  end
end
