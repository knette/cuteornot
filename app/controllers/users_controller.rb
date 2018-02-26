class UsersController < ApplicationController
  before_action :authorize, only: [:show, :edit, :update, :destroy]
  
  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save 
        session[:user_id] = @user.index
        redirect_to user_path @user.id
    else redirect_to new_user_path
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
