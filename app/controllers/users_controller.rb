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
    @users = User.find(params[:id])
    if @users.update(user_params)
      flash[:success] = "Congrats! You've edited an item!"
      redirect_to @users
    else
      flash[:danger] = "Editing item failed."
      render 'edit'
    end
  end

  def destroy
    @users = User.find(params[:id])
    @users.destroy

    redirect_to users_path
  end

  private
    def user_params
      params.require(:user).permit(:username, :email, :password)
    end
end
