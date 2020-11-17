class Booking < ApplicationRecord
  validates :booking_date, presence: true
  validates :created_at, presence: true
  validates :updated_at, presence: true
  validates :user_id, presence: true, uniqueness: true
  validates :sport_session_id, presence: true, uniqueness: true

  belongs_to :user
  belongs_to :sport_sessions
end
