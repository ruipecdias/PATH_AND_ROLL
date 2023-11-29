
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

# Incident Locations in Downtown Lisbon
locations = [
  'Praça do Comércio', 'Rossio Square', 'Avenida da Liberdade',
  'Chiado', 'Bairro Alto', 'Alfama', 'Cais do Sodré', 'Príncipe Real',
  'Santa Justa Lift', 'Campo de Ourique'
]

# Create Incidents
locations.each_with_index do |location, index|
  category = ['Accident', 'Construction', 'Structural'].sample
  description = case category
                when 'Accident'
                  "A minor biking incident occurred near #{location}, Lisbon, with no severe injuries but some traffic disruption."
                when 'Construction'
                  "Unexpected construction work at #{location}, Lisbon, leading to pedestrian detours and minor inconvenience."
                when 'Structural'
                  "A small structural issue was noticed at a building in #{location}, Lisbon, causing some concern among residents."
                end

  Incident.create!(
    user: users.sample,
    location: "#{location}, Lisbon",
    category: category,
    description: description,
    img_url: "https://via.placeholder.com/150", # Replace with actual image URLs
    status: [true, false].sample
  )
end

incidents = Incident.all

# Create Comments for each Incident
incidents.each do |incident|
  rand(5..10).times do
    Comment.create!(
      user: users.sample,
      incident: incident,
      content: Faker::Lorem.sentence
    )
  end
end

puts "Seeding completed!"