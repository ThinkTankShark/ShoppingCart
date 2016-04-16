class OrdersController < ApplicationController
  def show
  end

  def create
    @order = Order.create
    session[:cart].each do |id, qty|
      product = Product.find(id)
      @order.orders_products << OrdersProduct.create(order_id: @order.id, product_id: id, quantity: qty)
      product.update(quantity: (product.quantity - qty))
    end

    session[:cart].clear
    session[:subtotal].clear
    render orders_show_path
  end
end
