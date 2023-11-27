# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# seeds.rb

# Create 10 users
10.times do
  User.create!(
    email: Faker::Internet.email,
    password: 'password', # You might want to change this for production
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  )
end

# Create 5 incidents and 3 comments per incident
users = User.all
categories = ['Accident', 'Construction', 'Structural']

5.times do
  incident = Incident.create!(
    location: Faker::Address.full_address,
    category: categories.sample,
    img_url: Faker::LoremPixel.image,
    description: Faker::Lorem.paragraph,
    user: users.sample,
    comments_count: 3,
    status: Incident.statuses.keys.sample
  )

  # Create 3 comments for each incident
  3.times do
    Comment.create!(
      incident: incident,
      user: users.sample,
      content: Faker::Lorem.sentence
    )
  end
end

# Create associations between users and incidents through affecting_pins
users.each do |user|
  incidents = Incident.all.sample(rand(1..3))
  incidents.each do |incident|
    AffectingPin.create!(user: user, incident: incident)
  end
end
