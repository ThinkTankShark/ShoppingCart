class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @categories = Category.new
  end

  def edit
    @categories = Category.find(params[:id])
  end

  def create
    @categories = Category.new(category_params)
    if @categories.save
      flash[:success] = "Congrats! You've saved a new item!"
      redirect_to @categories
    else
      flash[:danger] = "Saving new item failed."
      render 'new'
    end
  end

  def update
    @categories = Category.find(params[:id])
    if @categories.update(category_params)
      flash[:success] = "Congrats! You've edited an item!"
      redirect_to @categories
    else
      flash[:danger] = "Editing item failed."
      render 'edit'
    end
  end

  def destroy
    @categories = Category.find(params[:id])
    @categories.destroy

    redirect_to category_path
  end

  private
    def category_params
      params.require(:category).permit(:name)
    end
end
