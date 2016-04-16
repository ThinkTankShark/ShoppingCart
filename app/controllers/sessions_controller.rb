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
    if !session[:cart]
      session[:cart] = {}
    end
    if !session[:stock]
      session[:stock] = @product.quantity - 1
    end
    if session[:stock] > 0
      if session[:cart][@product.id.to_s]
        session[:cart][@product.id.to_s] += 1
        session[:stock] -= 1
        p @product.id
        p session[:stock]
      else
        session[:cart][@product.id.to_s] = 1
      end
      @cart = session[:cart]
      @subtotal = 0
      @num_in_cart = 0
      @cart.each do |id, qty|
        @subtotal += (Product.find(id).price * qty)
        @num_in_cart += qty
      end
      render '_subtotal', layout: false
    else
      flash[:danger] = "This item is currently out of stock."
      redirect_to '/'
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
