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

imgurls =[
  "https://res.cloudinary.com/dnwea2j0w/image/upload/v1701441105/IMG_0260_oqg0ll.jpg",
  "https://res.cloudinary.com/dnwea2j0w/image/upload/v1701441103/IMG_0290_npedl5.jpg",
  "https://res.cloudinary.com/dnwea2j0w/image/upload/v1701366717/tklbcdn3tzf9wc1omqwq.jpg",
  "https://res.cloudinary.com/dnwea2j0w/image/upload/v1701366716/al1f1zln67d88uvqnoh8.jpg",
  "https://res.cloudinary.com/dnwea2j0w/image/upload/v1701366715/tvyw5lplhymmdesixo4n.jpg",
  "https://res.cloudinary.com/dnwea2j0w/image/upload/v1701366713/cvtmufvmwf8zpbesoo2e.jpg",
  "https://res.cloudinary.com/dnwea2j0w/image/upload/v1701366711/wr2v5lzdfpfee7tuewpv.jpg",
  "https://res.cloudinary.com/dnwea2j0w/image/upload/v1701366710/iwaxudgt5xp7xjhehmbi.jpg",
  "https://res.cloudinary.com/dnwea2j0w/image/upload/v1701441106/IMG_0295_pvnj3o.jpg",
  "https://res.cloudinary.com/dnwea2j0w/image/upload/v1701441123/IMG_0261_tcpa91.jpg"
]




imgurl = "https://res.cloudinary.com/dnwea2j0w/image/upload/v1701366717/tklbcdn3tzf9wc1omqwq.jpg"
additional_imgurls = ["https://res.cloudinary.com/dnwea2j0w/image/upload/v1701441104/IMG_0294_qsdagt.jpg",
"https://res.cloudinary.com/dnwea2j0w/image/upload/v1701441102/IMG_0289_pqwoav.jpg",
"https://res.cloudinary.com/dnwea2j0w/image/upload/v1701365047/xlfu79agdpnnard3j88n.jpg"]

# Create Incidents
locations.each_with_index do |location, index|
  category = ['Accident', 'Construction', 'Structural'].sample
  description = case category
  when 'Accident'
    "Today, as I walked by #{location}, I witnessed a shocking accident. The scene was chaotic, and emergency services were on their way."
  when 'Construction'
    "I noticed some construction work happening at #{location}. It looks like they're repairing the road, causing some traffic delays."
  when 'Structural'
    "There's a building near #{location} that seems to be undergoing some structural issues. It caught my attention due to the safety concerns it poses."
  end

  incident = Incident.create!(
    user: users.sample,
    location: location,
    category: category,
    description: description,
    status: [true, false].sample
  )

  # Attach one or two images to the incident
  file = URI.open(imgurls[index])
  incident.photos.attach(io: file, filename: "location_#{index}.jpg", content_type: 'image/jpg')

  # For the first incident, add an additional image
  if index < 3
    additional_file = URI.open(additional_imgurls[index])
    incident.photos.attach(io: additional_file, filename: "additional_location_#{index}.jpg", content_type: 'image/jpg')
  end
end

# Create Comments for each Incident

puts "Seeding completed!"