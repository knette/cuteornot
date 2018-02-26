class DogsController < ApplicationController
  def index
    @dogs = Dog.all
  end

  def show
    @dog = Dog.find(params[:id])
  end

  def new
    @dog = current_user.dog.new
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
  end

  def destroy
    @dog = Dog.find(params[:id])
    @dog.destroy
    redirect_to "/dogs"
  end

  private
  def post_params
    return params.require(:picture).permit(:name)
  end

end
