class SportSession < ApplicationRecord
  validates :sport, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :location, presence: true
  validates :start_time, presence: true
  validates :duration, presence: true
  validates :price, presence: true
  validates :session_cover_picture, presence: true
  validates :capacity, presence: true
  
  belongs_to :user
  has_many :bookings
  has_one_attached :photo
end
