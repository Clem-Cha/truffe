class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def create
    @booking = Booking.new(booking_params)
    # we need `restaurant_id` to associate booking with corresponding dog
    @dog = dog.find(params[:dog_id])
    @booking.dog = @dog
    if @booking.save
      redirect_to bookings_path
    else
      render :new
    end
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    redirect_to booking_path(@booking)
  end

  private

  def booking_params
    params.require(:booking).permit(:dog_id, :user_id, :start_date, :end_date, :status)
  end
end
