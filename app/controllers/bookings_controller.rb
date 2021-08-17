class BookingsController < ApplicationController
  def index
    @bookings = policy_scope(Booking)
    @bookings_pending = @bookings.select { |booking| booking.status == "pending" }
    @bookings_approved = @bookings.select { |booking| booking.status == "approved" }
    @bookings_rejected = @bookings.select { |booking| booking.status == "rejected" }
  end

  def create
    @booking = Booking.new(booking_params)
    authorize @booking
    @dog = Dog.find(params[:dog_id])
    @booking.dog = @dog
    @booking.user = current_user
    @booking.status = "approved"
    if @booking.save
      redirect_to bookings_path
    else
      render 'dogs/show'
    end
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.update(booking_params)
    redirect_to booking_path(@booking)
  end

  private

  def booking_params
    params.require(:booking).permit(:dog_id, :user_id, :start_date, :end_date, :status)
  end
end
