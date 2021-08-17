class DogsController < ApplicationController
  def index
    @dogs = policy_scope(Dog)
  end

  def show
    @dog = Dog.find(params[:id])
  end

  def new
    @dog = Dog.new
  end

  def create
    @dog = Dog.new(dog_params)
    authorize @dog
    @dog.user = current_user

    if @dog.save
      redirect_to dog_path(@dog)
    else
      render :new
    end
  end

  def edit
    @dog = Dog.find(params[:id])
  end

  def update
    @dog = Dog.find(params[:id])
    authorize @dog
    @dog.update(dog_params)
    redirect_to dogs_path(@dog)
  end

  private
  def dog_params
    params.require(:dog).permit(:name, :age, :breed, :category, :description, :start_date, :end_date)
  end
end
