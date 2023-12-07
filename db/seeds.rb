require 'open-uri'

AffectingPin.destroy_all
Comment.destroy_all
Incident.destroy_all
User.destroy_all

# Users
puts "Users completed!"

stevie = User.create!(
  email: 'stevie@wonder.com',
  password: 'Stevie1#',
  first_name: 'Stevie',
  last_name: 'Wonder'
)

frida = User.create!(
  email: 'frida@kahlo.com',
  password: 'Frida#1',
  first_name: 'Frida',
  last_name: 'Kahlo'
)

hawking = User.create!(
  email: 'stephen@hawking.com',
  password: 'Stephen1#',
  first_name: 'Stephen',
  last_name: 'Hawking',
)

reeve = User.create!(
  email: 'christopher@reeve.com',
  password: 'Reeve1#',
  first_name: 'Christopher',
  last_name: 'Reeve',
)

salvador = User.create!(
  email: 'salvador@mendes.com',
  password: 'Salvador1#',
  first_name: 'Salvador',
  last_name: 'Mendes de Almeida'
)

nick = User.create!(
  email: 'nick@vujicic.com',
  password: 'Nick#1',
  first_name: 'Nick',
  last_name: 'Vujicic',
)

bocelli = User.create!(
  email: 'andrea@bocelli.com',
  password: 'bocelli#1',
  first_name: 'Andrea',
  last_name: 'Bocelli',
)

anto = User.create!(
  email: 'antonella.correale1@gmail.com',
  password:'123456',
  first_name: 'Antonella',
  last_name: 'Correale'
)

antonella = User.create!(
  email: 'antonellacorreale@gmail.com',
  password:'123456',
  first_name: 'Antonella',
  last_name: 'Correale'
)

users = [stevie, frida, hawking, reeve, salvador, nick, bocelli, anto, antonella]


userimg =[
  "https://res.cloudinary.com/dnwea2j0w/image/upload/v1701876821/stevie_wonder_z464ws.jpg",
  "https://res.cloudinary.com/dnwea2j0w/image/upload/v1701876822/frida_sbcz9p.jpg",
  "https://res.cloudinary.com/dnwea2j0w/image/upload/v1701876822/hawking_hj5rkb.jpg",
  "https://res.cloudinary.com/dnwea2j0w/image/upload/v1701876822/reeve_jbrdhv.jpg",
  "https://res.cloudinary.com/dnwea2j0w/image/upload/v1701876822/salvador_xjk4gs.png",
  "https://res.cloudinary.com/dnwea2j0w/image/upload/v1701876822/nick_gb8yvu.jpg",
  "https://res.cloudinary.com/dnwea2j0w/image/upload/v1701876614/bocelli_rrxito.jpg",
  "https://res.cloudinary.com/dnwea2j0w/image/upload/v1701876614/bocelli_rrxito.jpg",
  "https://res.cloudinary.com/dnwea2j0w/image/upload/v1701948646/avatar_b8sllq.jpg"
]


  users.each_with_index do |user, index|
    begin
      file = URI.open(userimg[index])
      user.photo.attach(io: file, filename: "user_#{user.id}.jpg", content_type: 'image/jpg') if file.present?
      user.save
    rescue StandardError => e
      puts "Error attaching photo for user #{user.id}: #{e.message}"
    end
  end


imgurl = "https://res.cloudinary.com/dnwea2j0w/image/upload/v1701366717/tklbcdn3tzf9wc1omqwq.jpg"
additional_imgurls = ["https://res.cloudinary.com/dnwea2j0w/image/upload/v1701441104/IMG_0294_qsdagt.jpg",
"https://res.cloudinary.com/dnwea2j0w/image/upload/v1701441102/IMG_0289_pqwoav.jpg",
"https://res.cloudinary.com/dnwea2j0w/image/upload/v1701365047/xlfu79agdpnnard3j88n.jpg"]

# Incidents
puts "Incidents completed!"
  incident1 = Incident.create!(
    user: stevie,
    location: 'Rua Tomás Ribeiro 115f, Lisbon',
    category: 'Construction',
    description: "Hole in the pavement that obstructs the sidewalk and
    makes mobility very dangerous, due to the amount of high speed riding cars in the area.",
    status: false
  )

  incident2 = Incident.create!(
    user: antonella,
    location: 'Calçada Conde Pombeiro 10, Lisbon',
    category: 'Construction',
    description: "Spotted an obstacle in Intendente, making mobility tricky. 🚧",
    status: true
  )


  incident3 = Incident.create!(
    user: antonella,
    location: 'Rua Luciano Cordeiro 103, Lisbon',
    category: 'Construction',
    description: "Observing a substantial obstacle,
    a sizable hole disrupting the sidewalk's accessibility.🚧
    Let's approach this with scientific precision.",
    status: false
  )

  incident4 = Incident.create!(
    user: nick,
    location: 'Praça da Figueira, Lisbon',
    category: 'Accident',
    description: "Tram collision",
    status: true
  )

  incident5 = Incident.create!(
    user: salvador,
    location: 'Estação de Comboio De Campolide, Lisbon',
    category: 'Structural',
    description: "Navigating Campolide's charming sidewalks. 🏞️
    Currently, my wheelchair and I are practicing the art of
    tightrope rolling on a path seemingly designed for acrobats, not wheelchairs.
    I thought about joining the circus, but sidewalks should be a bit more
    accommodating, don't you think?",
    status: false
  )

  incident6 = Incident.create!(
    user: salvador,
    location: 'Caracol da Graça 4A, Lisbon',
    category: 'Structural',
    description: "Guess what? Alfama's charming streets decided to go for a
    no-elevator vibe, especially around the stair-infested zones.
    🚫🏰 Considering taking up levitation or teleportation next.
    Meanwhile, a little accessibility magic would be nice.",
    status: true
  )

  incident7 = Incident.create!(
    user: bocelli,
    location: 'Rua Braamcamp 1, Lisbon',
    category: 'Structural',
    description: "Broken calçada portuguesa, impossible to circulate with a wheelchair",
    status: false
  )

  incidents = [ incident1, incident2, incident3, incident4, incident5, incident6, incident7]

  incidentsphotos = [
    [
      'https://res.cloudinary.com/dnwea2j0w/image/upload/v1701877040/IMG_0260_3_owu4oz.jpg',
      'https://res.cloudinary.com/dnwea2j0w/image/upload/v1701877437/IMG_0289_1_bebqot.jpg',
      'https://res.cloudinary.com/dnwea2j0w/image/upload/v1701877436/IMG_0290_1_vsjxjr.jpg',
      'https://res.cloudinary.com/dnwea2j0w/image/upload/v1701877436/IMG_0291_1_mm0kcf.jpg',
      'https://res.cloudinary.com/dnwea2j0w/image/upload/v1701877435/IMG_0292_1_saai52.jpg'
    ],
    ['https://res.cloudinary.com/dnwea2j0w/image/upload/v1701877434/passeio_campolide_tjejk5.jpg'],
    ['https://res.cloudinary.com/dnwea2j0w/image/upload/v1701876822/IMG_0261_1_zncui4.jpg'],
    ['https://res.cloudinary.com/dnwea2j0w/image/upload/v1701877442/tram_lisboa3_bfoetv.jpg'],
    ['https://res.cloudinary.com/dnwea2j0w/image/upload/v1701876821/campolide_fpgosf.jpg'],
    ['https://res.cloudinary.com/dnwea2j0w/image/upload/v1701877435/lisboa_stairs_r0tr1i.jpg'],
    ['https://res.cloudinary.com/dnwea2j0w/image/upload/v1701877435/lisboa_stairs_r0tr1i.jpg']
  ]

incidents.each_with_index do |incident, index|
  if incidentsphotos[index].count == 1
    file = URI.open(incidentsphotos[index][0])
    incident.photos.attach(
      io: file,
      filename: "location_#{index}.jpg",
      content_type: 'image/jpg'
    )
  else
    incidentsphotos[index].each_with_index do |img, i|
      file = URI.open(img)
      incident.photos.attach(
        io: file,
        filename: "location_#{i}.jpg",
        content_type: 'image/jpg'
      )
    end
  end
  incident.save
end

# Comments
puts "Comments completed!"

  comment1 = Comment.create!(
    user: frida,
    incident_id: Incident.first.id,
    content: "Oh, those barricades have my artistic spirit trapped! 🌺🚧"
  )
  comment2 = Comment.create!(
    user: hawking,
    incident_id: Incident.first.id,
    content: "A black hole for mobility!"
  )
  comment3 = Comment.create!(
    user: reeve,
    incident_id: Incident.first.id,
    content: "Like kryptonite for our wheels, my friend! 🦸‍♂️🚧"
  )
  comment4 = Comment.create!(
    user: salvador,
    incident_id: Incident.first.id,
    content: "Don’t even get me started on this 🤬!"
  )
  comment5 = Comment.create!(
    user: nick,
    incident_id: Incident.first.id,
    content: "I'm right there with you, arm in arm…well, sort of"
  )
  comment6 = Comment.create!(
    user: bocelli,
    incident_id: Incident.first.id,
    content: "Like navigating a concert hall blindfolded 🧑🏻‍🦯"
  )

  comment7 = Comment.create!(
    user: stevie,
    incident_id: Incident.first.id,
    content: "🎶 Isn't it tricky, this path we're on? 🎤🕶️"
  )

# People affected
puts "People affected completed"

  steviepin = AffectingPin.create!(
    user_id: stevie.id,
    incident_id: incident1.id
  )

  fridapin = AffectingPin.create!(
    user_id: frida.id,
    incident_id: incident1.id
  )

  hawkingpin = AffectingPin.create!(
    user_id: hawking.id,
    incident_id: incident1.id
  )

  reevepin = AffectingPin.create!(
    user_id: reeve.id,
    incident_id: incident1.id
  )

  salvadorpin = AffectingPin.create!(
    user_id: salvador.id,
    incident_id: incident1.id
  )

  nickpin = AffectingPin.create!(
    user_id: nick.id,
    incident_id: incident1.id
  )

  bocellipin = AffectingPin.create!(
    user_id: bocelli.id,
    incident_id: incident1.id
  )

  antonellapin = AffectingPin.create!(
    user_id: antonella.id,
    incident_id: incident5.id
  )

  antonellapin = AffectingPin.create!(
    user_id: antonella.id,
    incident_id: incident6.id
  )

  antonellapin = AffectingPin.create!(
    user_id: antonella.id,
    incident_id: incident7.id
  )

  puts "Seeding completed!"
