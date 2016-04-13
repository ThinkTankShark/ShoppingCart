require 'rails_helper'

RSpec.describe ProductsController, type: :controller do




  before do
      http_login
  end


  describe "#index" do

    it "should load all products" do
      @all_products = 3.times.map do
        Product.create!(title: "Title", description: "Desc", price: rand(1..100))
      end
      get :index
      expect(assigns[:products]).to eq @all_products
      expect(response.status).to eq 200
      expect(response).to have_rendered(:index)
    end
  end

  describe "#create" do

    context "when given valid params" do
      let (:params) {{product: {title: "My title", description: "A valid title", price: 5}}}
      it "should increment products in the database by 1" do

        expect{post :create, params}.to change{Product.count}.by(1)
      end
      it "responds with a status of 302" do

        post :create, params
        expect(response.status).to eq 302
      end
    end
    context "when given invalid params" do
      let (:params) {{product: {description: "A valid title", price: 5}}}
      it "should not increment products in the database" do
        expect{post :create, params}.to_not change{Product.count}
      end
      it "re-renders the new page" do
        post :create, params
        expect(response).to have_rendered(:new)
      end
    end
  end

  describe "#update" do
    let!(:old_product) { FactoryGirl.create(:product) }
    context 'on valid params' do
      let(:params) {{product: {title: old_product.title, description: "new description", price: old_product.price, id: old_product.id}}}
      it 'responds with a status of 302' do
        patch :update, params
      expect(response.status).to eq(302)
      end
    end
  end

  describe "#destroy" do
    let!(:product) { Product.create(title: "My title", description: "A valid title", price: 5) }
    it 'responds with a status of 302' do
      delete :destroy, id: product.id
      expect(response.status).to eq(302)
    end
    it 'decrements the products in the database by 1' do
      expect{delete :destroy, id: product.id}.to change{Product.count}.by(-1)
    end
  end

end
