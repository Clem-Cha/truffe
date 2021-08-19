class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @top3_dogs = Dog.joins(:bookings, :reviews)
                    .select("dogs.id, avg(reviews.rating) as average_rating")
                    .group("dogs.id")
                    .order("average_rating DESC")
                    .limit(3)

    @dogs = Dog.where(id: @top3_dogs)

    raise

  end

  def dashboard
    @dogs = policy_scope(Dog).where(user_id: current_user).order(created_at: :desc)

    @dog_ids = @dogs.map { |dog| dog.id  }
    @bookings_pending = Booking.where(dog_id: @dog_ids, status: "pending").order(updated_at: :desc)
    @bookings_history = Booking.where(dog_id: @dog_ids, status: ["approved", "rejected"]).order(updated_at: :desc)
  end

  def profil
  end

end
