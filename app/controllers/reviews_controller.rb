class ReviewsController < ApplicationController

  def create
    @review = Review.new(review_params)
    @booking = Booking.find(params[:booking_id])
    authorize @review
    @review.booking = @booking
    @review.save
    redirect_to booking_path(@booking)
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
