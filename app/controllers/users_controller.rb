class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @users = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        UserMailer.welcome_email(@user).deliver_later
        format.html { redirect_to '/products', notice: 'User was successfully created.'}
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update

  end

  def destroy

  end

  private
    def user_params
      params.require(:user).permit(:username, :email, :password)
    end
end
