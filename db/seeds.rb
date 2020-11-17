# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require: 'faker'

user1 = User.create! :email => 'chris@gmail.com', :password => '123456', :password_confirmation => '123456'
user2 = User.create! :email => 'agathe@gmail.com', :password => '123456', :password_confirmation => '123456'
user3 = User.create! :email => 'corentin@gmail.com', :password => '123456', :password_confirmation => '123456'
user4 = User.create! :email => 'oscar@gmail.com', :password => '123456', :password_confirmation => '123456'

User.all.each do |user|
  new_sport_session = SportSession.new(
    sport: 'yoga',
    title: 'steam yoga',
    description: 'detox your body and align your chakras',
    location: 'Coyoacan, Mexico City',
    start_time: Time.new(2021, 1, 1, 8, 0, 0).hour,
    duration: 60,
    price: 100,
    capacity: 10,
  )
  new_sport_session.create!

  new_sport_session2 = SportSession.new(
    sport: Faker::Esport.game,
    title: Faker::Company.name,
    description: Faker::Company.bs,
    location: Faker::Address.full_address,
    start_time: Time.new(2021, 1, 1, 10, 0, 0).hour,
    duration: 90,
    price: 150,
    capacity: 20,
  )
  new_sport_session2.save!
end

SportSession.all.each do |sport_session|
  new_user = User.create! :email => Faker::Internet.email, :password => '123456', :password_confirmation => '123456'
  new_booking = Booking.new(
    booking_date: Faker::Date.between(from: '2021-01-01', to: '2021-12-31'),
    user_id: new_user.id,
    sport_session_id: sport_session.id
  )
  new_booking.save!
  new_review = Review.new(
    rating: rand(1..5),
    commentary: Faker::Restaurant.review,
    user_id: new_booking.user_id,
    booking_id: new_booking.id
  )
  new_review.save!
end


create_table "reviews", force: :cascade do |t|
  t.integer "rating"
  t.text "commentary"
  t.datetime "created_at", precision: 6, null: false
  t.datetime "updated_at", precision: 6, null: false
  t.bigint "user_id", null: false
  t.bigint "booking_id", null: false
  t.index ["booking_id"], name: "index_reviews_on_booking_id"
  t.index ["user_id"], name: "index_reviews_on_user_id"