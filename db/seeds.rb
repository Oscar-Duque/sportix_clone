require 'faker'

Review.destroy_all
Booking.destroy_all
SportSession.destroy_all
User.destroy_all

p user1 = User.create!(email: 'chris@gmail.com', first_name: 'Christian', last_name: 'Zamora', password: '123456', password_confirmation: '123456')
p SportSession.create!(
  sport: 'boxing',
  title: "Christian's Boxing for Beginners",
  description: 'The best boxing class for beginners',
  location: 'Coyoacan, Mexico City',
  start_time: Time.new(2021, 1, 1, 8, 0, 0),
  finish_time: Time.new(2021, 1, 1, 9, 0, 0),
  price: 15,
  capacity: 15,
  user_id: user1.id,
  session_cover_picture: "mark-adriane-FH6JcaCrYJ0-unsplash_zaetrp",
  rating: 4
)

p user2 = User.create!(email: 'agathe@gmail.com', first_name: 'Agathe', last_name: 'Laburthe-Tolra', password: '123456', password_confirmation: '123456')
p SportSession.create!(
  sport: 'football',
  title: "Advanced Football",
  description: 'Perfect your football abilities using the french method',
  location: 'Polanco, Mexico City',
  start_time: Time.new(2021, 1, 1, 9, 0, 0),
  finish_time: Time.new(2021, 1, 1, 10, 30, 0),
  price: 15,
  capacity: 10,
  user_id: user2.id,
  session_cover_picture: "giorgio-trovato-iP4Ju2-4paQ-unsplash_f70x8e",
  rating: 4
)
p Booking.create!(
  booking_date: Faker::Date.between(from: '2021-01-01', to: '2021-12-31'),
  user_id: user2.id,
  sport_session_id: user1.sport_sessions.first.id
)

p user3 = User.create!(email: 'corentin@gmail.com', first_name: 'Corentin', last_name: 'Julienne', password: '123456', password_confirmation: '123456')
p SportSession.create!(
  sport: 'chess',
  title: 'Proffesional Level Chess Classes',
  description: 'Learn to play chess with a Grand Master',
  location: 'Benito Juarez, Mexico City',
  start_time: Time.new(2021, 1, 1, 20, 0, 0),
  finish_time: Time.new(2021, 1, 1, 22, 0, 0),
  price: 30,
  capacity: 5,
  user_id: user3.id,
  session_cover_picture: "felix-mittermeier-nAjil1z3eLk-unsplash_xc73ww",
  rating: 4
)
p Booking.create!(
  booking_date: Faker::Date.between(from: '2021-01-01', to: '2021-12-31'),
  user_id: user3.id,
  sport_session_id: user1.sport_sessions.first.id
)

p user4 = User.create!(email: 'oscar@gmail.com', first_name: 'Oscar', last_name: 'Duque', password: '123456', password_confirmation: '123456')
p SportSession.create!(
  sport: 'yoga',
  title: 'Steam Yoga',
  description: 'Smash stress, build strength, get results and feel amazing',
  location: 'Anta Fe, Mexico City',
  start_time: Time.new(2021, 1, 1, 7, 0, 0),
  finish_time: Time.new(2021, 1, 1, 8, 0, 0),
  price: 20,
  capacity: 5,
  user_id: user3.id,
  session_cover_picture: "photo-1532798442725-41036acc7489_keovlh",
  rating: 4
)
p Booking.create!(
  booking_date: Faker::Date.between(from: '2021-01-01', to: '2021-12-31'),
  user_id: user4.id,
  sport_session_id: user1.sport_sessions.first.id
)

=begin 
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
    user_id: user.id,
    session_cover_picture: "cloudinary_id_here",
    rating: 5
  )
  p new_sport_session
  new_sport_session2 = SportSession.create!(
    sport: Faker::Esport.game,
    title: Faker::Company.name,
    description: Faker::Company.bs,
    location: Faker::Address.full_address,
    start_time: Time.new(2021, 1, 1, 10, 0, 0),
    duration: Time.new(2021, 1, 1, 1, 30, 0),
    price: 150,
    capacity: 20,
    user_id: user.id,
    session_cover_picture: "cloudinary_id_here",
    rating: 5
  )
  p new_sport_session2
end 
=end

SportSession.all.each do |sport_session|
  p user5 = User.create!(email: Faker::Internet.email, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, password: '123456', password_confirmation: '123456')
  p new_booking = Booking.create!(
    booking_date: Faker::Date.between(from: '2021-01-01', to: '2021-12-31'),
    user_id: user5.id,
    sport_session_id: sport_session.id
  )
=begin
p new_review = Review.create!(
    rating: rand(3..5),
    commentary: Faker::Restaurant.review,
    booking_id: new_booking.id
  ) 
=end
end
