class Booking < ApplicationRecord
  belongs_to :dog
  belongs_to :user
  has_many :reviews

  validates :status, inclusion: { in: %w(approved pending rejected) }
  validates :start_date, presence: true
  validates :end_date, presence: true
end
