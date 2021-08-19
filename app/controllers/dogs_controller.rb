class DogsController < ApplicationController

  def index
    @dogs = policy_scope(Dog)

    if params[:category].present?
      @dogs = @dogs.where(category: params[:category])
    end

    if params[:breed].present?
      @dogs = @dogs.where(breed: params[:breed])
    end

    if params[:start_date].present?
      @dogs = @dogs.after(params[:start_date])
    end

    if params[:end_date].present?
      @dogs = @dogs.before(params[:end_date])
    end

    # Geocoder
    @markers = @dogs.geocoded.map do |dog|
      {
        lat: dog.latitude,
        lng: dog.longitude,
        info_window: render_to_string(partial: "info_window", locals: { dog: dog }),
      }
    end
  end

  def show
    @dog = Dog.find(params[:id])
    authorize @dog
    @booking = Booking.new
    @reviews = @dog.reviews
    @aggregated_reviews = @reviews.sum(:rating) / @reviews.size
    @markers = [{
      lat: @dog.latitude,
      lng: @dog.longitude,
      info_window: render_to_string(partial: "info_window", locals: { dog: @dog }),
    }]
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
