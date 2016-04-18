class PurchasesController < ApplicationController

  def index
    @purchases = Purchase.where(user_id: session[:id])
  end

  def show
    @purchase = Purchase.find(params[:id])
  end

  def new

  end

  def create
    @purchase = Purchase.create(total_cost: purchase_params[:total_cost], user_id: session[:id])
    session[:purchase].each_pair do |key, value|
      product = Product.find(key)
      prod_purch = ProductsPurchase.create(purchase_id: @purchase.id, product_id: product.id, quantity: value)
      product.quantity -= value.to_i
    end

    if @purchase.save
      session[:purchase].clear
      flash[:success] = "Thank you for your puchase!"
      redirect_to purchase_path(@purchase.id)
    else
      flash[:danger] = "Purchase failed."
      render 'cart'
    end
  end

  def cart
    session[:purchase] = {} if !session[:purchase]
    session[:purchase][purchase_params[:product_id]] = purchase_params[:quantity]
    num_in_cart = session[:purchase].length
    render json: num_in_cart
  end

  private
  def purchase_params
    params.require(:purchase).permit(:quantity, :product_id, :total_cost)
  end

end
