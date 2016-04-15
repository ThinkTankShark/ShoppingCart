class PurchasesController < ApplicationController

  def index
    @purchases = Purchase.all
  end

  def show
    @purchase = Purchase.find(params[:id])
  end

  def new
    @purchase = Purchase.new
    #purchase_params should be stuff sent from form
    @product = Product.find_by(purchase_params)
    @quandtity = params[:quantity]
  end

  def create
    puts "In the create controller"
    # @purchase = Purchase.new(product_purchase_params)
    # if @purchase.save
    #   flash[:success] = "Thank you for your puchase!"
    #   redirect_to products_path
    # else
    #   flash[:danger] = "Purchase failed."
    #   render 'new'
    # end
  end

  def cart
    session[:purchase] = {} if !session[:purchase]
    session[:purchase][product_purchase_params[:product_id]] = product_purchase_params[:quantity]
    num_in_cart = session[:purchase].length
    render json: num_in_cart
  end

  private
  def product_purchase_params
    params.require(:purchase).permit(:quantity, :product_id)
  end

  # def purchase_params
  #   params.require(:purchase).permit(:total_cost)
  # end

end
