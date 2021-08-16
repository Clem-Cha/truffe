class Review < ApplicationRecord
  belongs_to :booking

  validates :comment, presence: true
  validates :rating, presence: true
  validates :rating, inclusion: { in: (0..10), message: "%{value} is not a valid rating, it has to be between 0 and 10" }
end
