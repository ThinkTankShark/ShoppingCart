require 'rails_helper'

RSpec.describe ProductsController, type: :controller do

  before do
    @all_products = 3.times.map do
      Product.create!(title: "Title", description: "Desc", price: rand(1..100))
  end
  end

  describe "#index" do
    it "should load all products" do
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

  describe "#show" do

  end

  describe "#new" do

  end

  describe "#update" do

  end

  describe "#create" do

  end

end
