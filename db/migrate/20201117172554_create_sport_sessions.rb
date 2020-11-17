class CreateSportSessions < ActiveRecord::Migration[6.0]
  def change
    create_table :sport_sessions do |t|
      t.string :sport
      t.string :title
      t.text :description
      t.string :location
      t.time :start_time
      t.time :duration
      t.float :price
      t.integer :rating
      t.string :session_cover_picture
      t.integer :capacity

      t.timestamps
    end
  end
end
