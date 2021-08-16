class BookingsController < ApplicationController
  def show
    @booking = Booking.find(params[:id])
    @user = User.find(@booking.user_id)
    @dog = Dog.find(@booking.dog_id)
    @review = Review.find(@booking.id)
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
