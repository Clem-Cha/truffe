class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def dashboard
    @dogs = policy_scope(Dog)
    @dogs = Dog.where(user_id: current_user)


    @bookings = policy_scope(Booking)
    @bookings_pending = Booking.where(user_id: current_user, status: "pending")
    # @bookings_pending = @bookings.select { |booking| booking.status == "pending" }
    @bookings_approved= Booking.where(user_id: current_user, status: "approved")
    @bookings_rejected= Booking.where(user_id: current_user, status: "rejected")
    # @bookings_history = @bookings.select { |booking| booking.status == "approved" || booking.status == "rejected" }
  end
end
