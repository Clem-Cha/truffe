class ReviewsController < ApplicationController

  def new
    @review = Review.new
    authorize @review
    @booking = Booking.find(params[:booking_id])
  end

  def create
    @review = Review.new(review_params)
    @booking = Booking.find(params[:booking_id])
    authorize @review
    @review.booking = @booking
    @review.save
    redirect_to bookings_path
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
