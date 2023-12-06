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

pontus = User.create!(
  email: 'pontus@lofgren.com',
  password: 'Pontus1#',
  first_name: 'Pontus',
  last_name: 'Löfgren'
)

cintia = User.create!(
  email: 'cynthia@albuquerque.com',
  password: 'Cynthia1#',
  first_name: 'Cynthia',
  last_name: 'Albuquerque'
)

martim = User.create!(
  email: 'martim@costa.com',
  password: 'Martim1#',
  first_name: 'Martim',
  last_name: 'Costa'
)

david = User.create!(
  email: 'david@carmo.com',
  password: 'David1#',
  first_name: 'David',
  last_name: 'Carmo'
)

margarida = User.create!(
  email: 'margarida@toureiro.com',
  password: 'Margarida1#',
  first_name: 'Margarida',
  last_name: 'Toureiro'
)

bernardo = User.create!(
  email: 'bernardo@ralao.com',
  password: 'Bernardo1#',
  first_name: 'Bernardo',
  last_name: 'Ralão'
)

rui = User.create!(
  email: 'rui@dias.com',
  password: 'Ruidias1#',
  first_name: 'Rui',
  last_name: 'Dias'
)

users = [pontus, cintia, martim, david, margarida, bernardo, rui]

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
  "https://res.cloudinary.com/dnwea2j0w/image/upload/v1701441123/IMG_0261_tcpa91.jpg",
  "https://res.cloudinary.com/dnwea2j0w/image/upload/v1701446847/132779101_pkugp7.jpg",
  "https://res.cloudinary.com/dnwea2j0w/image/upload/v1701446848/33777796_ha8x5o.jpg",
  "https://res.cloudinary.com/dnwea2j0w/image/upload/v1701446847/146536223_gwgkhe.jpg",
  "https://res.cloudinary.com/dnwea2j0w/image/upload/v1701446849/146834417_w4mtww.jpg",
  "https://res.cloudinary.com/dnwea2j0w/image/upload/v1701446848/Screen_Shot_2023-12-01_at_16.03.00_ya4fqs.png",
  "https://res.cloudinary.com/dnwea2j0w/image/upload/v1701446848/Screen_Shot_2023-12-01_at_16.03.21_avwntz.png",
  "https://res.cloudinary.com/dnwea2j0w/image/upload/v1701444685/n0pjqvod2fv4gh67mh2vr18ojp9y.jpg"
]

userimg =[
  "https://res.cloudinary.com/dnwea2j0w/image/upload/v1701446848/33777796_ha8x5o.jpg",
  "https://res.cloudinary.com/dnwea2j0w/image/upload/v1701446847/146536223_gwgkhe.jpg",
  "https://res.cloudinary.com/dnwea2j0w/image/upload/v1701446847/132779101_pkugp7.jpg",
  "https://res.cloudinary.com/dnwea2j0w/image/upload/v1701446848/Screen_Shot_2023-12-01_at_16.03.21_avwntz.png",
  "https://res.cloudinary.com/dnwea2j0w/image/upload/v1701446848/Screen_Shot_2023-12-01_at_16.03.00_ya4fqs.png",
  "https://res.cloudinary.com/dnwea2j0w/image/upload/v1701446849/146834417_w4mtww.jpg",
  "https://res.cloudinary.com/dnwea2j0w/image/upload/v1701446849/146834417_w4mtww.jpg"
]


users.each_with_index do |user, index|
  file = URI.open(userimg[index])
  user.photo.attach(io: file, filename: "user_#{user.id}.jpg", content_type: 'image/jpg')
  user.save
end

# Locations in Downtown Lisbon
locations = [
  'Praça do Comércio, Lisbon', 'Rossio Square, Lisbon', 'Avenida da Liberdade, Lisbon',
  'Chiado, Lisbon', 'Bairro Alto, Lisbon', 'Alfama, Lisbon', 'Cais do Sodré, Lisbon', 'Príncipe Real, Lisbon',
  'Santa Justa Lift, Lisbon', 'Campo de Ourique, Lisbon'
]

# Safe image URLs for Cloudinary






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


comment1 = Comment.create!(
  user: pontus,
  incident_id: Incident.first.id,
  content: "I was trying to buy sweedish meatballs at IKEA and I couldn't get there because of this obstruction. I'm so hungry now!"
)
comment2 = Comment.create!(
  user: cintia,
  incident_id: Incident.first.id,
  content: "I was going to meet friends for a dinner and I got stuck here for 30 minutes. When I finally arrived there was no food left :("
)
comment3 = Comment.create!(
  user: martim,
  incident_id: Incident.first.id,
  content: "I was distracted listening to music and I fell into a hole in the ground!"
)
comment4 = Comment.create!(
  user: david,
  incident_id: Incident.first.id,
  content: "I fall and broke my leg because of this obstruction. I guess I won't be playing in the next Olympics"
)
comment5 = Comment.create!(
  user: margarida,
  incident_id: Incident.first.id,
  content: "This is absurd!!!!!"
)
comment6 = Comment.create!(
  user: bernardo,
  incident_id: Incident.first.id,
  content: "I was crossing the street on my board and I got stuck. Next time I'll go to Caparica."
)
puts "Seeding completed!"
