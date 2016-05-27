class AdminController < ApplicationController

  def dashboard
    @products = Product.all
    @categories = Category.all
    admin = User.find_by(username: 'tim')
    if session[:id] != admin.id
      flash.now[:danger] = "Sorry, only administrators can access this page."
      render template: "products/index"
    end
  end
end
