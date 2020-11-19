class ChangeColumnNameOnBookings < ActiveRecord::Migration[6.0]
  def change
    rename_column :sport_sessions, :duration, :finish_time
  end
end
