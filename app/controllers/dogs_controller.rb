class DogsController < ApplicationController
  def index
    @dogs = Dog.all
  end

  def show
    @dog = Dog.find(params[:id])
    @user = User.find(@dog.user_id) 
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
    redirect_to dog_path(@dog.id)
  end

  def downvote
    @dog = Dog.find(params[:id])
    @dog.downvote_by current_user
    redirect_to dog_path(@dog.id)
  end

  def score
    @score = self.get_upvotes.size - self.get_downvotes.size
  end

  private
  def post_params
    return params.require(:dog).permit(:picture, :name)
  end

end
