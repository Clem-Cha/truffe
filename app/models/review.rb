class Review < ApplicationRecord
  belongs_to :booking, :dependent => :destroy

  validates :rating, presence: true
  validates :rating, inclusion: { in: (0..10), message: "%{value} is not a valid rating" }
end
