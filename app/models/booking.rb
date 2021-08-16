class Booking < ApplicationRecord
  belongs_to :dog, :dependent => :destroy
  belongs_to :user, :dependent => :destroy

  validates :start_date, presence: true
  validates :end_date, presence: true
end
