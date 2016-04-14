class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:id] = user.id
      redirect_to "/products"
    else
      render 'new'
    end
  end

  def destroy
    session[:id] = nil
    redirect_to products_path
  end

  def shop
    @product = Product.find(params[:product_id])
    p @product.title
    if !session[:cart]
      session[:cart] = {}
    end
    if session[:cart][@product.id.to_s]
        session[:cart][@product.id.to_s] += 1
        p session[:cart]
    else
        session[:cart][@product.id.to_s] = 1
        p session[:cart]
    end
    redirect_to '/'
  end

end
