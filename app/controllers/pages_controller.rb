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
end
