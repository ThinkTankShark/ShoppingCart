require 'spec_helper'

RSpec.feature "Products", type: :feature do
  let(:new_product) { FactoryGirl.create(:product) }
  context 'a guest user' do
    it 'can see the page title on home page' do
      visit root_path
      expect(page).to have_content("Welcome Client!")
    end
  end

  describe 'filling out a form' do
    it 'can create a new product and see it rendered on the page' do
      visit new_product_path
      title = "fake title"
      fill_in 'Title', with: title
      price = 33.00
      fill_in 'Price', with: price
      body = "Here is a body text"
      fill_in 'Description', with: body
      click_button 'Create Product'
      expect(page).to have_content(title)
    end
  end
end

