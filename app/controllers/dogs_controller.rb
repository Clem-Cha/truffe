class DogsController < ApplicationController

  def index
    @dogs = policy_scope(Dog)

    if params[:category].present? || params[:category_small].present?
      @dogs = @dogs.where(category: params[:category]  || params[:category_small])
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
    @bookings = policy_scope(Booking)
    @bookings_pending = @bookings.select { |booking| booking.status == "pending" }
    @bookings_approved = @bookings.select { |booking| booking.status == "approved" }
    @bookings_rejected = @bookings.select { |booking| booking.status == "rejected" }
  end

  def show
    @dog = Dog.find(params[:id])
    authorize @dog
    @booking = Booking.new
    @reviews = @dog.reviews
    # @aggregated_reviews = @reviews.sum(:rating) / @reviews.size
    @markers = [{
      lat: @dog.latitude,
      lng: @dog.longitude,
      info_window: render_to_string(partial: "info_window", locals: { dog: @dog }),
    }]

    @bookings = policy_scope(Booking)
    @bookings_pending = @bookings.select { |booking| booking.status == "pending" }
    @bookings_approved = @bookings.select { |booking| booking.status == "approved" }
    @bookings_rejected = @bookings.select { |booking| booking.status == "rejected" }
  end

  def new
    @dog = Dog.new

    @bookings = policy_scope(Booking)
    @bookings_pending = @bookings.select { |booking| booking.status == "pending" }
    @bookings_approved = @bookings.select { |booking| booking.status == "approved" }
    @bookings_rejected = @bookings.select { |booking| booking.status == "rejected" }
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

    @bookings = policy_scope(Booking)
    @bookings_pending = @bookings.select { |booking| booking.status == "pending" }
    @bookings_approved = @bookings.select { |booking| booking.status == "approved" }
    @bookings_rejected = @bookings.select { |booking| booking.status == "rejected" }
  end

  def edit
    @dog = Dog.find(params[:id])

    @bookings = policy_scope(Booking)
    @bookings_pending = @bookings.select { |booking| booking.status == "pending" }
    @bookings_approved = @bookings.select { |booking| booking.status == "approved" }
    @bookings_rejected = @bookings.select { |booking| booking.status == "rejected" }
  end

  def update
    @dog = Dog.find(params[:id])
    authorize @dog
    @dog.update(dog_params)
    redirect_to dashboard_path, notice: "Your dog's information have been updated"

    @bookings = policy_scope(Booking)
    @bookings_pending = @bookings.select { |booking| booking.status == "pending" }
    @bookings_approved = @bookings.select { |booking| booking.status == "approved" }
    @bookings_rejected = @bookings.select { |booking| booking.status == "rejected" }
  end

  def destroy
    @dog = Dog.find(params[:id])
    authorize @dog
    @dog.destroy
    redirect_to dashboard_path

    @bookings = policy_scope(Booking)
    @bookings_pending = @bookings.select { |booking| booking.status == "pending" }
    @bookings_approved = @bookings.select { |booking| booking.status == "approved" }
    @bookings_rejected = @bookings.select { |booking| booking.status == "rejected" }
  end

  private
  def dog_params
    params.require(:dog).permit(:breed, :category, :address, :start_date, :end_date, :name, :age, :description, photos: [])
  end
end
