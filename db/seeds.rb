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
  "https://static.globalnoticias.pt/jn/image.jpg?brand=jn&type=generate&guid=9da83dba-af20-451a-a363-2b6ffe6083c6",
  "https://c8.alamy.com/comp/J2690X/a-workman-repairing-a-cobbled-street-in-lisbon-portugal-J2690X.jpg",
  "https://media.gettyimages.com/id/1245458040/photo/workers-remove-muddy-watter-from-a-street-after-being-affected-by-a-flood-in-lisbon-on.jpg?s=612x612&w=gi&k=20&c=f4bvfn-rqlE2oynbf_6kHf_NoSBl3I-gLc9iAWONjPE=",
  "https://www.imago-images.com/bild/st/0108710651/s.jpg",
  "https://sol.sapo.pt/wp-content/uploads/2023/07/sol2017313573785-scaled.jpg",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTznyebFH1Tp536GywZ8oQAfqrKFsNLDtQjlYRlEvdymGYRPyzZJZ0agt-APFSIFG6z9DE&usqp=CAU",
  "https://media.euobserver.com/4f9aca9d7719ffe55bfa7ee21c52ff16.jpg",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQGZjlDxfJ5pdp3raMh04sgqKaPui6WesP23Q&usqp=CAU",
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

  Incident.create!(
    user: users.sample,
    location: location,
    category: category,
    description: description,
    img_url: imgurls[index], # Replace with actual image URLs
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