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

# session 2 Oscar

session5 = SportSession.new(
  sport: 'krav maga',
  title: 'Krav Maga',
  description: 'Learn to protect yourself with the most efficient self defense system',
  location: 'Coyoacan, Mexico City',
  start_time: Time.new(2021, 1, 3, 7, 0, 0),
  finish_time: Time.new(2021, 1, 3, 8, 0, 0),
  price: 50,
  capacity: 10,
  user: user4,
  rating: 5
)
file = URI.open('https://images.unsplash.com/photo-1577998555981-6e798325914e?ixlib=rb-1.2.1&auto=format&fit=crop&w=1486&q=80')
session5.photo.attach(io: file, filename: 'kravmaga.jpeg', content_type: 'image/jpeg')
p session5.save!

# session 3 Oscar

session6 = SportSession.new(
  sport: 'golf',
  title: 'Golf',
  description: 'Even presidents need to relax sometimes !',
  location: 'The White House, Washington D.C.',
  start_time: Time.new(2021, 2, 1, 7, 0, 0),
  finish_time: Time.new(2021, 2, 1, 8, 0, 0),
  price: 200,
  capacity: 3,
  user: user4,
  rating: 5
)
file = URI.open('https://ewscripps.brightspotcdn.com/dims4/default/3e98cab/2147483647/strip/true/crop/640x360+0+60/resize/1280x720!/quality/90/?url=https%3A%2F%2Fsharing.fox4now.com%2Fsharescnn%2Fphoto%2F2018%2F03%2F03%2FGettyImages-148110469_1520103103609_79900669_ver1.0_640_480.jpg')
session6.photo.attach(io: file, filename: 'golf.jpeg', content_type: 'image/jpeg')
p session6.save!

# session 4 Oscar

session7 = SportSession.new(
  sport: 'badminton',
  title: 'Badminton',
  description: 'Stay in shape with this advanced badminton course',
  location: 'Tepito, CDMX',
  start_time: Time.new(2020, 12, 1, 7, 0, 0),
  finish_time: Time.new(2020, 12, 1, 8, 0, 0),
  price: 25,
  capacity: 15,
  user: user4,
  rating: 3
)
file = URI.open('https://images.unsplash.com/photo-1602861067659-217e3898a90f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60')
session7.photo.attach(io: file, filename: 'badminton.jpeg', content_type: 'image/jpeg')
p session7.save!

# session 5 Oscar

session8 = SportSession.new(
  sport: 'fencing',
  title: 'Fencing',
  description: 'The thrill of sword duels, without the risks of bleeding out..',
  location: '11th District, Paris',
  start_time: Time.new(2021, 2, 1, 5, 0, 0),
  finish_time: Time.new(2021, 2, 1, 7, 0, 0),
  price: 50,
  capacity: 12,
  user: user4,
  rating: 5
)
file = URI.open('https://images.unsplash.com/photo-1529751480052-2f3f1839834e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60')
session8.photo.attach(io: file, filename: 'fencing.jpeg', content_type: 'image/jpeg')
p session8.save!

# session 6 Oscar

session9 = SportSession.new(
  sport: 'chess',
  title: 'Chess for beginners',
  description: 'Build a logical and strong mind while having fun !',
  location: 'Santa Fe, Mexico City',
  start_time: Time.new(2021, 1, 13, 7, 0, 0),
  finish_time: Time.new(2021, 1, 13, 9, 0, 0),
  price: 45,
  capacity: 13,
  user: user4,
  rating: 3
)
file = URI.open('https://images.unsplash.com/flagged/photo-1570551502611-c590dc45f644?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60')
session9.photo.attach(io: file, filename: 'chess_for_beginners.jpeg', content_type: 'image/jpeg')
p session9.save!

# session 7 Oscar

session10 = SportSession.new(
  sport: 'archery',
  title: 'Archery for Sharpshooters',
  description: 'Reach a high level using first class bows and arrows',
  location: 'Berlin, Germany',
  start_time: Time.new(2021, 3, 1, 7, 0, 0),
  finish_time: Time.new(2021, 3, 1, 9, 0, 0),
  price: 250,
  capacity: 10,
  user: user4,
  rating: 3
)
file = URI.open('https://images.unsplash.com/photo-1485802240079-a8245c843b95?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60')
session10.photo.attach(io: file, filename: 'archery.jpeg', content_type: 'image/jpeg')
p session10.save!

# session 8 Oscar

session11 = SportSession.new(
  sport: 'basketball',
  title: 'basketball',
  description: 'Relax and stay fit practicing basketball in CDMX',
  location: 'Condesa, Mexico City',
  start_time: Time.new(2020, 12, 1, 7, 0, 0),
  finish_time: Time.new(2020, 12, 1, 8, 0, 0),
  price: 15,
  capacity: 12,
  user: user4,
  rating: 3
)
file = URI.open('https://images.unsplash.com/photo-1519861531473-9200262188bf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60')
session11.photo.attach(io: file, filename: 'basketball.jpeg', content_type: 'image/jpeg')
p session11.save!

# session 9 Oscar

session12 = SportSession.new(
  sport: 'crossfit',
  title: 'crossfit',
  description: 'Not for newbies. Prepare to suffer !',
  location: 'Chapultepec, Mexico City',
  start_time: Time.new(2021, 4, 1, 7, 0, 0),
  finish_time: Time.new(2021, 4, 1, 8, 0, 0),
  price: 25,
  capacity: 30,
  user: user4,
  rating: 2
)
file = URI.open('https://images.unsplash.com/photo-1526401485004-46910ecc8e51?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60')
session12.photo.attach(io: file, filename: 'crossfit.jpeg', content_type: 'image/jpeg')
p session12.save!

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
