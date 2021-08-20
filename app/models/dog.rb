class Dog < ApplicationRecord
  # Geocoder
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings
  has_many_attached :photos
  DOG_CATEGORY = %w(walk sport flirt companion hunt holiday education breeding)

  # Validations
  validates :name, presence: true
  validates :age, presence: true
  validates :breed, presence: true
  validates :category, inclusion: { in: DOG_CATEGORY, message: "Sorry, this category does not exist yet." }
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :address, presence: true

  scope :after, -> (date) { where('start_date <= ?', Date.parse(date)) }
  scope :before, -> (date) { where('end_date >= ?', Date.parse(date)) }

  def average_rating
    return 0 if self.reviews.empty?
    self.reviews.pluck(:rating).sum / self.reviews.length.to_f
  end
end
