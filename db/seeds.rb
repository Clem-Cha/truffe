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
puts "🗑  Deleting all assets"
ActiveStorage::Attachment.all.each { |attachment| attachment.purge }
Review.destroy_all
Booking.destroy_all
Dog.destroy_all
User.destroy_all


puts "Creating 10 user seeds"
User.create(
    email: "test@gmail.com",
    first_name: "Jicama",
    last_name: "Team",
    phone_number: Faker::PhoneNumber.cell_phone,
    description: Faker::Quote.famous_last_words,
    street: Faker::Address.street_address,
    city: Faker::Address.city,
    zipcode: '75020',
    password: "123456",
    password_confirmation: "123456"
)

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

puts "Creating 20 dogs seeds"
count = 1
20.times do
  dog = Dog.new(
    name: Faker::Creature::Dog.name,
    age: rand(1..15),
    breed: Faker::Creature::Dog.breed,
    category: %w(walk sport flirt companion hunt holiday education breeding).sample,
    description: Faker::TvShows::BigBangTheory.quote,
    start_date: Faker::Date.backward(days: 14),
    end_date: Faker::Date.forward(days: 23),
    user: User.order('RANDOM()').first,
    address: (1..300).to_a.sample.to_s + " " + ["Rue de Vaugirard, Paris", "Avenue des Champs-Élysées, Paris", "bd de belleville, Paris", "bd voltaire, paris", "bd saint-germain, paris"].sample
  )
  dog.photos.attach(io: File.open("app/assets/images/dog#{count}_1.jpeg"), filename: 'dog-photo.png')
  dog.photos.attach(io: File.open("app/assets/images/dog#{count}_2.jpeg"), filename: 'dog-photo.png')
  dog.photos.attach(io: File.open("app/assets/images/dog#{count}_3.jpeg"), filename: 'dog-photo.png')
  dog.save!
  count += 1
end
puts "Finish creating dogs seeds"

puts "Creating 50 booking seeds"
50.times do
  Booking.create(
    start_date: Faker::Date.backward(days: 14),
    end_date: Faker::Date.forward(days: 23),
    status: %w(pending approved rejected).sample,
    dog: Dog.order('RANDOM()').first,
    user: User.order('RANDOM()').first
  )
end
approved_bookings = Booking.where(status: "approved")
approved_bookings.each do |booking|
  Review.create!(booking: booking, comment: "You get the point", rating: (1..10).to_a.sample)
end
puts "Finish creating booking seeds"

# puts "Creating 10 review seeds"
# 10.times do
#   Review.create(
#     comment: Faker::Quote.yoda,
#     rating: rand(0..10),
#     booking: Booking.order('RANDOM()').first
#   )
# end
# puts "Finish creating review seeds"
