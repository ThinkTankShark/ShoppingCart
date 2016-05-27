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
    session.clear
    redirect_to products_path
  end

  def shop
    @products = Product.all
    @categories = Category.all
    @product = Product.find(params[:product_id])
    product_id = @product.id.to_s
    if !session[:cart]
      session[:cart] = {}
    end
    if !session[:stock]
      session[:stock] = {}
    end
    if !session[:stock][product_id]
      session[:stock][product_id] = @product.quantity
    end
    if session[:stock][product_id] > 0
      if !session[:cart][product_id]
        session[:cart][product_id] = 1
      else
        session[:cart][product_id] += 1
      end
      session[:stock][product_id] -= 1
    else
      p "outta stock"
      flash[:danger] = "Sorry, that item is currently out of stock"
    end
    @cart = session[:cart]
    @subtotal = 0
    @num_in_cart = 0
    @cart.each do |id, qty|
      @subtotal += (Product.find(id).price * qty)
      @num_in_cart += qty
    end
    if request.xhr?
      render '_subtotal', layout: false
    else
      redirect_to products_path
    end
  end

  def remove_item
    id = params[:id]
    session[:cart][id] -= 1
    price = Product.find(id).price
    if request.xhr?
      data = {id: id, price: price, qty: session[:cart][id]}
      render :json => data, :status => :ok
    else
      render '_cart'
    end
  end

  def view_cart
    @cart = session[:cart]
    if request.xhr?
      render '_subtotal', layout: false
    else
      render '_cart'
    end
  end

end
