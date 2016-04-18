require 'rails_helper'


RSpec.feature "Purchases", js: true do


  let(:new_purchase) { FactoryGirl.create(:purchase)  }
  context 'a logged in user' do
    it 'can see the purchase summary' do
      visit new_purchase_path
      expect(page).to have_content("")
    end
  end

end