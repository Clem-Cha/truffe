class ReviewsController < ApplicationController

  def new
    @review = Review.new
    authorize @review
    @booking = Booking.find(params[:booking_id])

    @bookings = policy_scope(Booking)
    @bookings_pending = @bookings.select { |booking| booking.status == "pending" }
    @bookings_approved = @bookings.select { |booking| booking.status == "approved" }
    @bookings_rejected = @bookings.select { |booking| booking.status == "rejected" }
  end

  def create
    @review = Review.new(review_params)
    @booking = Booking.find(params[:booking_id])
    authorize @review
    @review.booking = @booking
    @review.save
    redirect_to bookings_path, notice: "Your review has been successfully added"

    @bookings = policy_scope(Booking)
    @bookings_pending = @bookings.select { |booking| booking.status == "pending" }
    @bookings_approved = @bookings.select { |booking| booking.status == "approved" }
    @bookings_rejected = @bookings.select { |booking| booking.status == "rejected" }
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
