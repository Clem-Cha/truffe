# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'date'
puts "Cleaning db"
Review.destroy_all
Booking.destroy_all
Dog.destroy_all
User.destroy_all


puts "Creating 10 user seeds"
10.times do
  user = User.new(
    email: Faker::Internet.email,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    phone_number: Faker::PhoneNumber.cell_phone,
    description: Faker::Quote.famous_last_words,
    street: Faker::Address.street_address,
    city: Faker::Address.city,
    zipcode: '75020',
    password: "123456",
    password_confirmation: "123456"
  )
  user.save
end
puts "Finish creating user seeds"

puts "Creating 10 dogs seeds"
20.times do
  Dog.create(
    name: Faker::Creature::Dog.name,
    age: rand(1..15),
    breed: Faker::Creature::Dog.breed,
    category: %w(walk sport flirt companion hunt holiday education breeding).sample,
    description: Faker::Creature::Dog.meme_phrase,
    start_date: Faker::Date.backward(days: 14),
    end_date: Faker::Date.forward(days: 23),
    user: User.order('RANDOM()').first
  )
end
puts "Finish creating dogs seeds"

puts "Creating 100 booking seeds"
50.times do
  Booking.create(
    start_date: Faker::Date.backward(days: 14),
    end_date: Faker::Date.forward(days: 23),
    status: %w(pending approved rejected).sample,
    dog: Dog.order('RANDOM()').first,
    user: User.order('RANDOM()').first
  )
end
puts "Finish creating booking seeds"

puts "Creating 5 review seeds"
10.times do
  Review.create(
    comment: Faker::Quote.yoda,
    rating: rand(0..10),
    booking: Booking.order('RANDOM()').first
  )
end
puts "Finish creating review seeds"
