class DogsController < ApplicationController

  def index
    @dogs = policy_scope(Dog)

    if params[:category] && params[:breed] && params[:start_date] && params[:end_date]
      raise
      @dogs_dates = @dogs.where("start_date >= ? AND end_date <= ?",  Date.parse(params[:start_date]), Date.parse(params[:end_date]))
      @dogs = @dogs_dates.where(category: params[:category], breed: params[:breed])
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
