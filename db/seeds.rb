# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create! :email => 'chris@gmail.com', :password => '123456', :password_confirmation => '123456'
user2 = User.create! :email => 'agathe@gmail.com', :password => '123456', :password_confirmation => '123456'
user3 = User.create! :email => 'corentin@gmail.com', :password => '123456', :password_confirmation => '123456'
user4 = User.create! :email => 'oscar@gmail.com', :password => '123456', :password_confirmation => '123456'


random = Random.new
sport = rand(w%('yoga', 'basketball', 'krav-maga', 'football', 'crossfit'))
price = rand(25..125)
duration = rand(15..90)
capacity = rand(1..20)
description = rand(w%('detox your body and align your chakras', 'take care of your health', 'enjoy and stay fit'))
title = rand(w%('Sport session with Emilio', 'Hard training not for pussies !!!', 'Enjoy a healthy training'))
location = "#{Faker::Address.city},#{Faker::Address.street_name}"
start_time = Time.new(2021, 1, 1, rand(1..12), 0, 0).hour

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
  end

  new_sport_session.create!

