# frozen_string_literal: true

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# first administrator
User.create(full_name: 'admin', email: 'admin@admin.com', password: '000000')

5.times do
  User.create(
    full_name: Faker::Name.name,
    email: Faker::Internet.email,
    password: '000000'
  )
end

5.times do
  Farm.create(
    name: Faker::Name.name,
    address: Faker::Address.full_address,
    area: Faker::Number.between(from: 100, to: 350),
    user_id: User.ids.sample
  )
end

50.times do
  race = [
    { id: 0, name: 'cattle' },
    { id: 1, name: 'sheep' },
    { id: 2, name: 'goat' },
    { id: 3, name: 'pig' },
    { id: 4, name: 'poultry_disease' },
    { id: 4, name: 'chicken' },
    { id: 5, name: 'rabbit' }
  ].sample

  Animal.create(
    name: "#{Faker::Creature::Animal.name} (#{race[:name]})",
    race: race[:name],
    encoded_race: race[:id],
    birth_at: Faker::Date.between(from: 10.years.ago, to: Date.today),
    weight: Faker::Number.between(from: 1, to: 350),
    gender: %w[M F].sample,
    farm_id: Farm.ids.sample
  )
end
