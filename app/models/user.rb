class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :dogs, dependent: :destroy
  has_many :bookings, dependent: :destroy

  def pending_bookings
    dogs.flat_map(&:bookings).select { |b| b.status == 'pending' }.count
  end
end
