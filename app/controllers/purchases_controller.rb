class PurchasesController < ApplicationController

  def index
    @purchase = Purchase.all
  end

  def show
    @purchase = Purchase.find(params[:id])
  end

  def new
    @purchase = Purchase.new
    #purchase_params should be stuff sent from form
    @product = Product.find_by(purchase_params)
    @quantity = params[:quantity]
  end

  def create
    @purchase = Purchase.new(purchase_params)
    if @purchase.save
      flash[:success] = "Thank you for your puchase!"
      redirect_to products_path
    else
      flash[:danger] = "Purchase failed."
      render 'new'
    end
  end

  private
  def purchase_params
    params.require(:purchase).permit(:total_cost)
  end

end
