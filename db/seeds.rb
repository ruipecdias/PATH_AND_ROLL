require 'open-uri'

AffectingPin.destroy_all
Comment.destroy_all
Incident.destroy_all
User.destroy_all

# Create Users
50.times do
  User.create!(
    email: Faker::Internet.unique.email,
    password: 'password',
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  )
end

users = User.all

# Locations in Downtown Lisbon
locations = [
  'Praça do Comércio, Lisbon', 'Rossio Square, Lisbon', 'Avenida da Liberdade, Lisbon',
  'Chiado, Lisbon', 'Bairro Alto, Lisbon', 'Alfama, Lisbon', 'Cais do Sodré, Lisbon', 'Príncipe Real, Lisbon',
  'Santa Justa Lift, Lisbon', 'Campo de Ourique, Lisbon'
]

# Safe image URLs for Cloudinary
imgurl = "https://c8.alamy.com/comp/J2690X/a-workman-repairing-a-cobbled-street-in-lisbon-portugal-J2690X.jpg"
additional_imgurl = "https://gibb.pt/wp-content/uploads/2017/09/IC17-%E2%80%93-CRIL-Sublan%C3%A7o-Buraca-Pontinha-%E2%80%93-Trabalhos-Complementares-%E2%80%93-Reposi%C3%A7%C3%A3o-do-Caneiro-da-Damaia-300x225.jpg"

# Create Incidents
locations.each_with_index do |location, index|
  category = ['Accident', 'Construction', 'Structural'].sample
  description = "An incident occurred near #{location}, requiring attention."

  incident = Incident.create!(
    user: users.sample,
    location: location,
    category: category,
    description: description,
    status: [true, false].sample
  )

  # Attach one or two images to the incident
  file = URI.open(imgurl)
  incident.photos.attach(io: file, filename: "location_#{index}.jpg", content_type: 'image/jpg')

  # For the first incident, add an additional image
  if index == 0
    additional_file = URI.open(additional_imgurl)
    incident.photos.attach(io: additional_file, filename: "additional_location_#{index}.jpg", content_type: 'image/jpg')
  end
end

# Create Comments for each Incident
Incident.all.each do |incident|
  rand(5..10).times do
    Comment.create!(
      user: users.sample,
      incident: incident,
      content: Faker::Lorem.sentence
    )
  end
end

puts "Seeding completed!"