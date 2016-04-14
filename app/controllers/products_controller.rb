class ProductsController < ApplicationController


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
    admin = User.find_by(username: 'tim')
    if session[:id] == admin.id
      if @product.save
        flash[:success] = "Congrats! You've saved a new item!"
        redirect_to @product
      else
        flash[:danger] = "Saving new item failed."
        render 'new'
      end
    else
      flash[:danger] = "Sorry, only administrators can create new products."
      render 'index'
    end
  end

  def update
    @product = Product.find(params[:id])
    admin = User.find_by(username: 'tim')
    if session[:id] == admin.id
      if @product.update(product_params)
        flash[:success] = "Congrats! You've edited an item!"
        redirect_to @product
      else
        flash[:danger] = "Editing item failed."
        render 'edit'
      end
    else
      flash[:danger] = "Sorry, only administrators can create new products."
      render 'index'
    end
  end

  def destroy
    admin = User.find_by(username: 'tim')
    if session[:id] == admin.id
      @product = Product.find(params[:id])
      @product.destroy
      redirect_to products_path
    else
      flash[:danger] = "Sorry, only administrators can delete products."
      render 'index'
    end
  end

  private
    def product_params
      params.require(:product).permit(:title, :description, :price, :img_url, :quantity, category_ids:[])
    end

end
