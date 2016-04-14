require 'rails_helper'

RSpec.describe AdminController, type: :controller do

  describe "GET #dashboard" do
    xit "returns http success" do
      get :dashboard
      expect(response).to have_http_status(:success)
    end
  end

end
