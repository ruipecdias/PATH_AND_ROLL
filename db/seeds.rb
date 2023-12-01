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
imgurls =[
  "https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/1200px-NES-Console-Set.jpg",
  "https://c8.alamy.com/comp/J2690X/a-workman-repairing-a-cobbled-street-in-lisbon-portugal-J2690X.jpg",
  "https://www.imago-images.com/bild/st/0108710651/s.jpg",
  "https://www.imago-images.com/bild/st/0108710651/s.jpg",
  "https://sol.sapo.pt/wp-content/uploads/2023/07/sol2017313573785-scaled.jpg",
  "https://sol.sapo.pt/wp-content/uploads/2023/07/sol2017313573785-scaled.jpg",
  "https://media.euobserver.com/4f9aca9d7719ffe55bfa7ee21c52ff16.jpg",
  "https://sol.sapo.pt/wp-content/uploads/2023/07/sol2017313573785-scaled.jpg",
  "https://gibb.pt/wp-content/uploads/2017/09/IC17-%E2%80%93-CRIL-Sublan%C3%A7o-Buraca-Pontinha-%E2%80%93-Trabalhos-Complementares-%E2%80%93-Reposi%C3%A7%C3%A3o-do-Caneiro-da-Damaia-300x225.jpg",
  "https://lisboaparapessoas.pt/wp-content/uploads/2022/11/cicloviaseteriosemel_06.jpg"

]
# Create Incidents
locations.each_with_index do |location, index|
  category = ['Accident', 'Construction', 'Structural'].sample
  description = case category
                when 'Accident'
                  "A passway accident occurred near #{location}, causing some disruption."
                when 'Construction'
                  "Construction work at #{location}, leading to pedestrian detours and inconvenience."
                when 'Structural'
                  "A structural issue was noticed in a building near #{location}, causing concern for passersby."
                end

                #uploaded_image = Cloudinary::Uploader.upload(imgurls[index])

  incident = Incident.create!(
    user: users.sample,
    location: location,
    category: category,
    description: description,
    #img_url: uploaded_image['url'], # Replace with actual image URLs
    status: [true, false].sample
  )
    file = URI.open("https://sol.sapo.pt/wp-content/uploads/2023/07/sol2017313573785-scaled.jpg")
    incident.photos.attach(io: file, filename: "location_#{index}.jpg", content_type: 'image/jpg')
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

additional_imgurls = [
  "https://via.placeholder.com/150/1",
  "https://via.placeholder.com/150/2",
  "https://via.placeholder.com/150/3"
]

# Upload images and create a new incident
additional_img_urls_uploaded = additional_imgurls.map do |img_url|
  Cloudinary::Uploader.upload(img_url)['url']
end

# Assuming you want to store these URLs in a serialized array or similar
new_incident = Incident.create!(
  user: users.sample,
  location: 'New Location, Lisbon',
  category: 'Construction',
  description: 'A new incident description.',
  img_url: additional_img_urls_uploaded.join(', '), # Storing the URLs as a comma-separated string
  status: [true, false].sample
)


puts "Seeding completed!"
