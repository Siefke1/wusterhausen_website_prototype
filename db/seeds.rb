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
# User.create!(email: 'peter@pan.de', password: 'peter@pan.de')

# 4.times do |i|
#   Topic.create!(
#     title: Faker::Hobby.activity
#   )
# end

# 20.times do |i|
#   Category.create!(
#     title: Faker::Hobby.activity,
#     topic_id: Faker::Number.between(from: 1, to: 4)
#   )
# end

# 40.times do |i|
#   Offer.create!(
#     title: Faker::Company.name,
#     description: Faker::Lorem.sentence(word_count: 20),
#     about_us: Faker::Lorem.sentence(word_count: 20),
#     email: Faker::Internet.email,
#     address: Faker::Address.street_address,
#     postcode: Faker::Address.postcode,
#     phone: Faker::PhoneNumber.cell_phone,
#     status: 1,
#     user_id: 1,
# )
# end

40.times do |i|
  CategoryOffer.create!(
    category_id: rand(1..20),
    offer_id: rand(1..40)
  )
end

p "there are new seeds"
