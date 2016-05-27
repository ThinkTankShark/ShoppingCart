class OrdersController < ApplicationController
  def show
  end

  def create
    @user = User.find(session[:id])
    @order = @user.orders.create

    session[:cart].each do |id, qty|
      product = Product.find(id)
      @order.orders_products << OrdersProduct.create(order_id: @order.id, 
        product_id: id, quantity: qty)
      
      product.update(quantity: (product.quantity - qty))
      UserMailer.order_confirmation(@order.orders_products).deliver
    end
    
    session.clear
    session[:id] = @user.id
    render orders_show_path
  end
end
