class Booking < ApplicationRecord
  validates :booking_date, presence: true
  validates :user_id, presence: true, uniqueness: true
  validates :sport_session_id, presence: true, uniqueness: true

  belongs_to :user
  belongs_to :sport_session
end
