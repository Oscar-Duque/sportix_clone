require 'faker'

Review.destroy_all
Booking.destroy_all
SportSession.destroy_all
User.destroy_all

user1 = User.create! :email => 'chris@gmail.com', :password => '123456', :password_confirmation => '123456'
user2 = User.create! :email => 'agathe@gmail.com', :password => '123456', :password_confirmation => '123456'
user3 = User.create! :email => 'corentin@gmail.com', :password => '123456', :password_confirmation => '123456'
user4 = User.create! :email => 'oscar@gmail.com', :password => '123456', :password_confirmation => '123456'

User.all.each do |user|
  new_sport_session = SportSession.create!(
    sport: 'yoga',
    title: 'steam yoga',
    description: 'detox your body and align your chakras',
    location: 'Coyoacan, Mexico City',
    start_time: Time.new(2021, 1, 1, 8, 0, 0),
    duration: Time.new(2021, 1, 1, 1, 0, 0),
    price: 100,
    capacity: 10,
    user_id: user.id
  )
  new_sport_session2 = SportSession.create!(
    sport: Faker::Esport.game,
    title: Faker::Company.name,
    description: Faker::Company.bs,
    location: Faker::Address.full_address,
    start_time: Time.new(2021, 1, 1, 10, 0, 0),
    duration: Time.new(2021, 1, 1, 1, 30, 0),
    price: 150,
    capacity: 20,
    user_id: user.id
  )
end

SportSession.all.each do |sport_session|
  new_user = User.create! :email => Faker::Internet.email, :password => '123456', :password_confirmation => '123456'
  new_booking = Booking.create!(
    booking_date: Faker::Date.between(from: '2021-01-01', to: '2021-12-31'),
    user_id: new_user.id,
    sport_session_id: sport_session.id
  )
  new_review = Review.create!(
    rating: rand(1..5),
    commentary: Faker::Restaurant.review,
    user_id: new_booking.user_id,
    booking_id: new_booking.id
  )
end
