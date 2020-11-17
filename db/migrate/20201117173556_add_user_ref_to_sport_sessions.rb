class AddUserRefToSportSessions < ActiveRecord::Migration[6.0]
  def change
    add_reference :sport_sessions, :user, null: false, foreign_key: true
  end
end
