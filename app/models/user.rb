class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :dogs
  has_many :bookings

  # Validations
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :street, presence: true
  validates :city, presence: true
  validates_format_of :zipcode, :with => /\A\d{5}(-\d{4})?\z/, :message => "Zip code should be valid"
end
