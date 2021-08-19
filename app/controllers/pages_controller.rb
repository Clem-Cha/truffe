class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def dashboard
    @dogs = policy_scope(Dog)
    @dogs = Dog.where(user_id: current_user)

    @dog_ids = @dogs.map { |dog| dog.id  }
    @bookings_pending = Booking.where(dog_id: @dog_ids, status: "pending")
    @bookings_history = Booking.where(dog_id: @dog_ids, status: ["approved", "rejected"])
  end

  def profil
  end

end
