require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
	
  # let(:new_order) { FactoryGirl.build(:order) }
  # let!(:blog) { FactoryGirl.create(:order) }
	# let(:user) { User.find(2) }
 #  	let(:order) { user.orders.create }
 #  	let(:order) { Product.find(id) }
 
  describe '#create' do

    let(:params) {Order.create(order_id: 1, product_id: 2, id: 3)}

    it 'increments articles in the database by 1' do
      expect{post :create, params}.to change{Order.count}.by(1)
    end
    
    xit 'responds with a status of 302' do
      post :create, params
      expect(response.status).to eq(302)
    end
  end
end
