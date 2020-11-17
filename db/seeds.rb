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
