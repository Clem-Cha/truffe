class Dog < ApplicationRecord
  belongs_to :user, :dependent => :destroy
  has_many :reviews, through :bookings
  DOG_CATEGORY = %w(walk sport flirt companion hunt holiday education breeding)

  # Validations
  validates :name, presence: true
  validates :age, presence: true
  validates :breed, presence: true
  validates :category, inclusion: { in: DOG_CATEGORY, message: "Sorry, this category does not exist yet." }
  validates :start_date, presence: true
  validates :end_date, presence: true
end
