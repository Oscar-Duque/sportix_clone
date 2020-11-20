require 'faker'
require "open-uri"

Review.destroy_all
Booking.destroy_all
SportSession.destroy_all
User.destroy_all

######## Create user1 (Christian Zamora), create a sport_session ########

user1 = User.new(email: 'chris@gmail.com', first_name: 'Christian', last_name: 'Zamora', password: '123456', password_confirmation: '123456')
file = URI.open('https://images.unsplash.com/photo-1528763380143-65b3ac89a3ff?ixlib=rb-1.2.1&auto=format&fit=crop&w=635&q=80')
user1.photo.attach(io: file, filename: 'user1.jpeg', content_type: 'image/jpeg')
p user1.save!
session1 = SportSession.new(
  sport: 'boxing',
  title: "Christian's Boxing for Beginners",
  description: 'The best boxing class for beginners',
  location: 'Coyoacan, Mexico City',
  start_time: Time.new(2021, 1, 1, 8, 0, 0),
  finish_time: Time.new(2021, 1, 1, 9, 0, 0),
  price: 15,
  capacity: 15,
  user_id: user1.id,
  rating: 4
)
file = URI.open('https://images.unsplash.com/photo-1589456506629-b2ea1a8576fb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1751&q=80')
session1.photo.attach(io: file, filename: 'box.jpeg', content_type: 'image/jpeg')
p session1.save!

######## Create user2 (Agathe Laburthe-Tolra), create a sport_session, book a boxing session ########

user2 = User.new(email: 'agathe@gmail.com', first_name: 'Agathe', last_name: 'Laburthe-Tolra', password: '123456', password_confirmation: '123456')
file = URI.open('https://images.unsplash.com/photo-1558898479-33c0057a5d12?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80')
user2.photo.attach(io: file, filename: 'user2.jpeg', content_type: 'image/jpeg')
p user2.save!
session2 = SportSession.new(
  sport: 'football',
  title: "Advanced Football",
  description: 'Perfect your football abilities using the french method',
  location: 'Polanco, Mexico City',
  start_time: Time.new(2021, 1, 1, 9, 0, 0),
  finish_time: Time.new(2021, 1, 1, 10, 30, 0),
  price: 15,
  capacity: 10,
  user_id: user2.id,
  rating: 4
)
file = URI.open('https://images.unsplash.com/flagged/photo-1571771710019-ca58cf80f225?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80')
session2.photo.attach(io: file, filename: 'football.jpeg', content_type: 'image/jpeg')
p session2.save!
p Booking.create!(
  booking_date: Faker::Date.between(from: '2021-01-01', to: '2021-12-31'),
  user_id: user2.id,
  sport_session_id: user1.sport_sessions.first.id
)

######## Create user2 (Corentin Julienne), create a sport_session, book a boxing session ########

user3 = User.new(email: 'corentin@gmail.com', first_name: 'Corentin', last_name: 'Julienne', password: '123456', password_confirmation: '123456')
file = URI.open('https://images.unsplash.com/photo-1544724107-6d5c4caaff30?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1347&q=80')
user3.photo.attach(io: file, filename: 'user3.jpeg', content_type: 'image/jpeg')
p user3.save!
session3 = SportSession.new(
  sport: 'chess',
  title: 'Professional Level Chess Classes',
  description: 'Learn to play chess with a Grand Master',
  location: 'Benito Juarez, Mexico City',
  start_time: Time.new(2021, 1, 1, 20, 0, 0),
  finish_time: Time.new(2021, 1, 1, 22, 0, 0),
  price: 30,
  capacity: 5,
  user_id: user3.id,
  rating: 4
)
file = URI.open('https://images.unsplash.com/photo-1523875194681-bedd468c58bf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1051&q=80')
session3.photo.attach(io: file, filename: 'chess.jpeg', content_type: 'image/jpeg')
p session3.save!
p Booking.create!(
  booking_date: Faker::Date.between(from: '2021-01-01', to: '2021-12-31'),
  user: user3,
  sport_session_id: user1.sport_sessions.first.id
)

######## Create user4 (Oscar Duque), create a sport_session, book a boxing session ########

user4 = User.create!(email: 'oscar@gmail.com', first_name: 'Oscar', last_name: 'Duque', password: '123456', password_confirmation: '123456')
file = URI.open('https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=80')
user4.photo.attach(io: file, filename: 'user4.jpeg', content_type: 'image/jpeg')
p user4.save!
session4 = SportSession.new(
  sport: 'yoga',
  title: 'Steam Yoga',
  description: 'Smash stress, build strength, get results and feel amazing',
  location: 'Anta Fe, Mexico City',
  start_time: Time.new(2021, 1, 1, 7, 0, 0),
  finish_time: Time.new(2021, 1, 1, 8, 0, 0),
  price: 20,
  capacity: 5,
  user: user4,
  rating: 4
)
file = URI.open('https://images.unsplash.com/photo-1532798442725-41036acc7489?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1334&q=80')
session4.photo.attach(io: file, filename: 'yoga.jpeg', content_type: 'image/jpeg')
p session4.save!
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

######## For every existing sport_session creates a user and book a session ########

SportSession.all.each do |sport_session|
  p user5 = User.create!(email: Faker::Internet.email, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, password: '123456', password_confirmation: '123456')
  p new_booking = Booking.create!(
    booking_date: Faker::Date.between(from: '2021-01-01', to: '2021-12-31'),
    user_id: user5.id,
    sport_session_id: sport_session.id
  )
end

=begin
p new_review = Review.create!(
    rating: rand(3..5),
    commentary: Faker::Restaurant.review,
    booking_id: new_booking.id
  ) 
=end
