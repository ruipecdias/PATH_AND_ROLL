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
  "https://res.cloudinary.com/dnwea2j0w/image/upload/v1701366720/hzx0n0imr2wx0nbqvfvc.jpg",
  "https://res.cloudinary.com/dnwea2j0w/image/upload/v1701366718/wj1oslsnfrv6rearwgfp.jpg",
  "https://res.cloudinary.com/dnwea2j0w/image/upload/v1701366717/tklbcdn3tzf9wc1omqwq.jpg",
  "https://res.cloudinary.com/dnwea2j0w/image/upload/v1701366716/al1f1zln67d88uvqnoh8.jpg",
  "https://res.cloudinary.com/dnwea2j0w/image/upload/v1701366715/tvyw5lplhymmdesixo4n.jpg",
  "https://res.cloudinary.com/dnwea2j0w/image/upload/v1701366713/cvtmufvmwf8zpbesoo2e.jpg",
  "https://res.cloudinary.com/dnwea2j0w/image/upload/v1701366711/wr2v5lzdfpfee7tuewpv.jpg",
  "https://res.cloudinary.com/dnwea2j0w/image/upload/v1701366710/iwaxudgt5xp7xjhehmbi.jpg",
  "https://res.cloudinary.com/dnwea2j0w/image/upload/v1701366709/xwnf3shf7jp9fiqueyms.jpg",
  "https://res.cloudinary.com/dnwea2j0w/image/upload/v1701364904/gqvmcdswtua5dytv5zne.jpg"
]




imgurl = "https://res.cloudinary.com/dnwea2j0w/image/upload/v1701366717/tklbcdn3tzf9wc1omqwq.jpg"
additional_imgurl = "https://gibb.pt/wp-content/uploads/2017/09/IC17-%E2%80%93-CRIL-Sublan%C3%A7o-Buraca-Pontinha-%E2%80%93-Trabalhos-Complementares-%E2%80%93-Reposi%C3%A7%C3%A3o-do-Caneiro-da-Damaia-300x225.jpg"

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