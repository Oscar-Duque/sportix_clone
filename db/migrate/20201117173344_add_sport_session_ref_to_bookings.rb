class AddSportSessionRefToBookings < ActiveRecord::Migration[6.0]
  def change
    add_reference :bookings, :sport_session, null: false, foreign_key: true
  end
end
