class DogsController < ApplicationController
  before_action :authorize, only: [:edit, :update, :destroy]

  def index
    @dogs = Dog.all
  end

  def show
    @dog = Dog.find(params[:id])
    @user = User.find(@dog.user_id) 
    @total_upvotes = @dog.get_upvotes.size
    @score = (@dog.get_upvotes.size.to_f/(@dog.get_upvotes.size.to_f + @dog.get_downvotes.size.to_f)) * 100
    rescue ZeroDivisionError
    0 
  end

  def new
    @dog = current_user.dogs.new
  end

  def create
    @dog = current_user.dogs.new post_params
    @dog.save
    redirect_to dog_path(@dog.id)
  end

  def edit
    @dog = Dog.find(params[:id])
  end

  def update
    @dog = Dog.find(params[:id])
    if @dog.update_attributes(post_params)
      @dog.save
      redirect_to dog_path(@dog.id)
    else
      render 'edit'
    end
  end

  def destroy
    @dog = Dog.find(params[:id])
    @dog.destroy
    redirect_to "/dogs"
  end

  def upvote
    @dog = Dog.find(params[:id])
    @dog.upvote_by current_user
    if !logged_in?
    flash[:warning] = "Login for your vote to count"
    end
    redirect_back(fallback_location: root_path)
  end

  def downvote
    @dog = Dog.find(params[:id])
    @dog.downvote_by current_user
    redirect_back(fallback_location: root_path)
  end

  def authorize
    unless logged_in?
      redirect_to new_session_path
    end
  end

  private
  def post_params
    return params.require(:dog).permit(:picture, :name)
  end

end
