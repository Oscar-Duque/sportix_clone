require 'Faker'

random = Random.new
sport = %w('yoga' 'basketball' 'krav-maga' 'football' 'crossfit').sample
price = rand(25..125)
duration = rand(15..90)
capacity = rand(1..20)
description = %w('detox your body and align your chakras' 'take care of your health' 'enjoy and stay fit').sample
title = %w('Sport session with Emilio' 'Hard training not for pussies !!!' 'Enjoy a healthy training').sample
location = "#{Faker::Address.city},#{Faker::Address.street_name}"
start_time = Time.new(2021, 1, 1, rand(1..12), 0, 0).hour



  100.times do
    db_item = Sport_session.create(
      sport: sport,
      title: title,
      description: description,
      location: location,
      start_time: start_time,
      duration: duration,
      price: price,
      capacity: capacity,
      )
    p db_item
  end
