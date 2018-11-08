class UsersController < ApplicationController
  def index
      @user = User.all
  end

  def new
    if current_user
      redirect_to user_path(current_user)
    else
      @user = User.new
    end
  end

  def create
    @user = User.new(user_params)
    puts "*****************"
    puts user_params
    if @user.save
      log_in @user
    else
      render '/register'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :password, :password_confirmation)
  end

end
