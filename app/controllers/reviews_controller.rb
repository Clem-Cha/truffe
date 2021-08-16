class ReviewsController < ApplicationController

  def create
    @review = Review.new
    @booking = Booking.find(params[:booking_id])
    @review.booking = @booking
    @review.save
    redirect_to booking_path(@booking)
  end

end
