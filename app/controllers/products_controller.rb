class ProductsController < ApplicationController
  # http_basic_authenticate_with name: "admin", password: "secret", except: [:index, :show]

  def index
    @categories = Category.all
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:success] = "Congrats! You've saved a new item!"
      redirect_to @product
    else
      flash[:danger] = "Saving new item failed."
      render 'new'
    end
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:success] = "Congrats! You've edited an item!"
      redirect_to @product
    else
      flash[:danger] = "Editing item failed."
      render 'edit'
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    redirect_to products_path
  end

  private
    def product_params
      params.require(:product).permit(:title, :description, :price, :img_url, :quantity, category_ids:[])
    end

end
