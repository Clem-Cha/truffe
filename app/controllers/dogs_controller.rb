class DogsController < ApplicationController

  def index
    if params[:category] && params[:breed] && params[:start_date] && params[:end_date]
      @dogs_dates = Dog.where("start_date >= ? AND end_date <= ?", params[:start_date], params[:end_date])
      @dogs = Dog.where({ category: params[:category], breed: params[:breed]})
    else
      @dogs = policy_scope(Dog)
    end
  end

  def show
    @dog = Dog.find(params[:id])
    authorize @dog
    @reviews = @dog.reviews
    @aggregated_reviews = @reviews.sum(:rating) / @reviews.size
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
    params.require(:dog).permit(:breed, :category, :start_date, :end_date)
  end
end
