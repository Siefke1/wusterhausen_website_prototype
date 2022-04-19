# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'
# Delete
#  Offer.delete_all
#  Category.delete_all
# Topic.delete_all
# p "Everything is Deleted"

# New Seeds
User.create!(email: 'peter@pan.de', password: 'peter@pan.de')

puts "creating topics..."
Topic.create!(title: "Schule")
Topic.create!(title: "Freizeit")
Topic.create!(title: "Schule, was nun?")
Topic.create!(title: "Hilfe und Unterstützung")
puts "topics created! creating categories..."

Category.create!(title: "Nachhilfe", topic_id: 1)
Category.create!(title: "Schulsozialarbeiter", topic_id: 1)
Category.create!(title: "Schulen", topic_id: 1)
Category.create!(title: "Schulsprecher*in / Kreisschülerverwaltung", topic_id: 1)
Category.create!(title: "Vereine", topic_id: 2)
Category.create!(title: "Engagement", topic_id: 2)
Category.create!(title: "Freizeiteinrichtungen", topic_id: 2)
Category.create!(title: "Anderes", topic_id: 2)
Category.create!(title: "Ausbildung", topic_id: 3)
Category.create!(title: "Praktikum", topic_id: 3)
Category.create!(title: "Berufsberatung", topic_id: 3)
Category.create!(title: "Anderes", topic_id: 3)
Category.create!(title: "Kinderhilfsorganisationen/Kindernotdienste", topic_id: 4)
Category.create!(title: "Anlaufstellen", topic_id: 4)
puts "categories created! creating offers..."

# INITIALIZE POSTCODES FOR OFFERS
postcodes = [
  "11011",
  "10711",
  "12099",
  "12105",
  "12165",
  "12207",
  "13053",
  "13595",
  "13505",
  "10557",
  "10589",
  "14059"
]

puts "offers created! creating join tables..."
40.times do |i|
  CategoryOffer.create!(
    category_id: rand(1..13),
    offer_id: rand(1..40)
  )
end
# CREATE 40 OFFERS
40.times do |i|
  Offer.create!(
    title: Faker::Company.name,
    description: Faker::Lorem.sentence(word_count: 20),
    about_us: Faker::Lorem.sentence(word_count: 20),
    email: Faker::Internet.email,
    address: Faker::Address.street_address,
    postcode: postcodes.sample,
    town: "Berlin",
    phone: Faker::PhoneNumber.cell_phone,
    status: 1,
    user_id: 1
)
end

# CREATE JOINTABLES OFFER/CATEGORY


30.times do
  Article.create!(
    title: Faker::Company.name,
    content: Faker::Lorem.sentence(word_count: 20),
    user_id: 1,
  )
end

p "done! there are new seeds!"
