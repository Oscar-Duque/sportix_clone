class Review < ApplicationRecord
  validates :commentary, presence: true
  validates :rating, inclusion: { in: 0..10 }
  # validates :created_at, presence: true
  # validates :updated_at, presence: true
  validates :user_id, presence: true, uniqueness: true
  validates :booking_id, presence: true, uniqueness: true

  belongs_to :user
  belongs_to :booking
end
