class UsersController < ApplicationController
  before_action :authorize, only: [:show, :edit, :update, :destroy]
  
  def index
  end

  def show
    @user = User.find(params[:id])
    if @user == current_user 
      @dogs = Dog.where(user_id:@user.id)
    else
      redirect_to root_path
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save 
        session[:user_id] = @user.id
        redirect_to user_path @user.id
    else 
      flash[:danger] = "Check your email and password"
      redirect_to new_user_path
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def authorize
    unless logged_in?
      redirect_to new_session_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
