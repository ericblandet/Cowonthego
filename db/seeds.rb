puts "seeding in process"

def rand_dates
  # return a random date within 30 days of today in both past and future directions.
  n = rand(0..30)
  date_1 = Date.today.advance(days: n)
  date_2 = Date.today.advance(days: n)
  if date_1 < date_2
    return [date_1, date_2]
  else
    return [date_2, date_1]
  end
end

## ORDER IMPORTANT 
puts"destroying existing instances of bookings, workspaces and users"
Booking.destroy_all
Workspace.destroy_all
User.destroy_all

puts"db clean now, bro"

puts "creating Eric"
User.create!(
  email: "eric@lewagon.com",
  password: "123456",
  username: "eric",
  first_name: "Eric",
  last_name: "Blandet",
  role: "owner"
)

puts "1 - adding The Office"
workspace = Workspace.create!(name:"The Office",
                              description:"Where creativity comes true, a nice a cosy little coworking space. It's like home",
                              address:"Avenue de Sévelin 13B, Lausanne",
                              capacity: 12,
                              daily_rate: 50,
                              user_id: User.find_by(email:"eric@lewagon.com").id
                            )

puts "adding pictures to #{workspace.name}"
file = URI.open("https://images.unsplash.com/photo-1522071820081-009f0129c71c?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80")
workspace.photo.attach(io: file, filename:"#{workspace.name}.png", content_type: 'image/png')

puts "2 - adding Gotham Lausanne"
workspace = Workspace.create!(name:"Gotham Lausanne",
                              description:"The biggest coworking of Switzerland, all utilities you need",
                              address:"Avenue de la gare, Lausanne",
                              capacity: 50,
                              daily_rate: 75,
                              user_id: User.find_by(email:"eric@lewagon.com").id
                            )

puts "adding pictures to #{workspace.name}"
file = URI.open("https://socialize-magazine.ch/wp-content/uploads/2017/09/Socialize-Mag-Gotham1.jpg")
workspace.photo.attach(io: file, filename:"#{workspace.name}.png", content_type: 'image/png')

puts "3 - adding Mountain Hub"
workspace = Workspace.create!(name:"Mountain Hub",
                              description:"Your coworking in a resort: ski, code, drink, sleep, repeat",
                              address:"Rue de Médran 3, 1936 Verbier",
                              capacity: 50,
                              daily_rate: 69,
                              user_id: User.find_by(email:"eric@lewagon.com").id
                            )

puts "adding pictures to #{workspace.name}"
file = URI.open("https://mountain-hub.com/src/meta/mountain-hub-verbier.jpg")
workspace.photo.attach(io: file, filename:"#{workspace.name}.png", content_type: 'image/png')

puts "4 - adding Mass Challenge"
workspace = Workspace.create!(name:"Mass Challenge",
                              description:"The best swiss start-up incubator. Fun Fact: you could meet some famous students from LeWagon Lausanne...We've been said that there would be a bar in the building...",
                              address:"Chemin du Closel 5, 1020 Renens",
                              capacity: 36,
                              daily_rate: 49,
                              user_id: User.find_by(email:"eric@lewagon.com").id
                            )

puts "adding pictures to #{workspace.name}"
file = URI.open("https://masschallenge.org/sites/all/themes/mc2/images/masschallenge-startup-accelerator.jpg")
workspace.photo.attach(io: file, filename:"#{workspace.name}.png", content_type: 'image/png')

puts "5 - adding Sev52"
workspace = Workspace.create!(name:"Sev52",
                              description:"L'idée?
                              Offrir un lieu partagé en plusieurs espaces distincts et flexibles, suffisamment grand pour donner libre cours à ses projets. L’endroit est propice aux échanges les plus divers et variés.
                              La formule magique?
                              De la place, un loyer raisonnable, un environnement stable mais éclectique, et un accès 24h/24.",
                              address:"Avenue de Sévelin 52, 1004 Lausanne",
                              capacity: 15,
                              daily_rate: 80,
                              user_id: User.find_by(email:"eric@lewagon.com").id
                            )

puts "adding pictures to #{workspace.name}"
file = URI.open("https://images.squarespace-cdn.com/content/v1/56f1680b2fe1317d865c11c7/1547562567319-FUU46SV0M98TW7RJ094F/ke17ZwdGBToddI8pDm48kGPVK--wGoWXJsqwlxbZlQN7gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z4YTzHvnKhyp6Da-NYroOW3ZGjoBKy3azqku80C789l0mwONMR1ELp49Lyc52iWr5enfxu_O4VeONvneR-F6W8oeFhFqSrYyNrfPB9Y70_gvQ/sev52-2959.jpg?format=1500w")
workspace.photo.attach(io: file, filename:"#{workspace.name}.png", content_type: 'image/png')

puts "6 - adding Work'n'Share"
workspace = Workspace.create!(name:"Work'n'Share",
                              description:"Work’n’Share c’est votre espace de coworking au coeur de la Suisse Romande à Lausanne Ouchy. Cet espace est dédié aux entrepreneurs, start ups, indépendants, salariés de tout horizon qui veulent travailler et recevoir leurs clients dans un cadre dynamique, convivial et professionnel.",
                              address:"Rue du Liseron 7, 1006 Lausanne",
                              capacity: 50,
                              daily_rate: 60,
                              user_id: User.find_by(email:"eric@lewagon.com").id
                            )

puts "adding pictures to #{workspace.name}"
file = URI.open("https://www.google.com/maps/uv?pb=!1s0x478c2fd00e4c4163%3A0x4971c3c4716c1c45!3m1!7e115!4shttps%3A%2F%2Flh5.googleusercontent.com%2Fp%2FAF1QipPwlTZtv6M68DjTuVuhDrutPfgH7GvUlhzdjnwR%3Dw260-h175-n-k-no!5scoworking%20lausanne%20-%20Recherche%20Google!15sCgIgAQ&imagekey=!1e10!2sAF1QipPwlTZtv6M68DjTuVuhDrutPfgH7GvUlhzdjnwR&hl=fr#")
workspace.photo.attach(io: file, filename:"#{workspace.name}.png", content_type: 'image/png')

puts "7 - adding SportWorks"
workspace = Workspace.create!(name:"SportWorks",
                              description:"SportWorks is the co-working community for sport business professionals based in the heart of the Olympic Capital in the prestigious Maison du Sport International. We offer an experience that goes beyond co-working in Lausanne. Here, members become part of a long-term community with the influencers of the sport business.",
                              address:"Avenue de Rhodanie 54, 1007 Lausanne",
                              capacity: 25,
                              daily_rate: 30,
                              user_id: User.find_by(email:"eric@lewagon.com").id
                            )

puts "adding pictures to #{workspace.name}"
file = URI.open("https://www.sportworks.ch/en/business/getbanner?w=920&h=680&mode=max")
workspace.photo.attach(io: file, filename:"#{workspace.name}.png", content_type: 'image/png')

puts "8 - adding Passage 9"
workspace = Workspace.create!(name:"Passage 9",
                              description:"Besoin d'une ou plusieurs places de travail pour monter votre projet ou votre startup? L'espace de co-working Passage 9 vous propose des places de travail entièrement équipées dans un cadre de travail unique.",
                              address:"PASSAGE ST-FRANÇOIS 9, CH-1003 LAUSANNE",
                              capacity: 10,
                              daily_rate: 45,
                              user_id: User.find_by(email:"eric@lewagon.com").id
                            )

puts "adding pictures to #{workspace.name}"
file = URI.open("https://images.unsplash.com/photo-1497366754035-f200968a6e72?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80")
workspace.photo.attach(io: file, filename:"#{workspace.name}.png", content_type: 'image/png')

puts "9 - adding Impact hub Lausanne"
workspace = Workspace.create!(name:"Impact hub Lausanne",
                              description:"Nous proposons un espace inspirant et du soutien pour une communauté dynamique porteuse de projets et d’événements impactants !",
                              address:"Rue du Jura 11, CH - 1004 Lausanne",
                              capacity: 45,
                              daily_rate: 65,
                              user_id: User.find_by(email:"eric@lewagon.com").id
                            )

puts "adding pictures to #{workspace.name}"
file = URI.open("https://www.google.com/maps/uv?pb=!1s0x478c2e28dd3c3b7b%3A0xe63af32d75408e0b!3m1!7e115!4shttps%3A%2F%2Flh5.googleusercontent.com%2Fp%2FAF1QipOUvqXcmkZYWQ3GbuwDr4kY_D2b73pZPWNfz1j3%3Dw260-h175-n-k-no!5scoworking%20lausanne%20-%20Recherche%20Google!15sCgIgAQ&imagekey=!1e10!2sAF1QipOUvqXcmkZYWQ3GbuwDr4kY_D2b73pZPWNfz1j3&hl=fr#")
workspace.photo.attach(io: file, filename:"#{workspace.name}.png", content_type: 'image/png')

puts "10 - adding ThinkSpace"
workspace = Workspace.create!(name:"ThinkSpace",
                              description:"Nous proposons aux start-ups et PME de venir s’installer dans des locaux accueillants en plein cœur de Lausanne. La communauté du ThinkSpace vous permet de travailler dans un lieu de vie professionnel, dynamique et ergonomique où il fait bon se rencontrer et partager ses expériences, tout en se concentrant sur son activité de manière optimale.",
                              address:"Rue Etraz 4, CH-1003 Lausanne",
                              capacity: 18,
                              daily_rate: 40,
                              user_id: User.find_by(email:"eric@lewagon.com").id
                            )

puts "adding pictures to #{workspace.name}"
file = URI.open("https://www.google.com/maps/uv?pb=!1s0x478c2e3455313c2b:0x104bd1ba9c452d2!3m1!7e115!4shttps://lh5.googleusercontent.com/p/AF1QipNjp6yS8gVIiVFr9O6ti8gJfkktBEYLLL8je5Yy%3Dw260-h175-n-k-no!5scoworking+lausanne+-+Recherche+Google!15zQ2dJZ0FRPT0&imagekey=!1e10!2sAF1QipNjp6yS8gVIiVFr9O6ti8gJfkktBEYLLL8je5Yy&hl=fr")
workspace.photo.attach(io: file, filename:"#{workspace.name}.png", content_type: 'image/png')

puts "11 - adding T19 bis"
workspace = Workspace.create!(name:"T19 bis",
                              description:"L’espace coworking du T19 bis à Lausanne a été créé par Marina et Laurent Bonnet, fondateurs de plusieurs PME lausannoises de e-commerce.
                              Ouvrir un espace où toute sorte de personnes qui exercent toutes sortes d’activités peuvent se rencontrer et échanger a été une évidence pour eux. Imaginez venir travailler le matin et saluer vos collègues comme si vous les connaissiez depuis des années. Pouvoir rencontrer d’autre startuppers qui sont passés par les mêmes étapes que vous ou alors simplement rire autour d’un verre une après-midi sur la terrasse. C’est exactement l’ambiance que recherchaient Marina et Laurent! Une ambiance accueillante, chaleureuse et très fun où on a pas l’impression de travailler!",
                              address:"Avenue de Tivoli 19bis – 1007 Lausanne",
                              capacity: 16,
                              daily_rate: 39,
                              user_id: User.find_by(email:"eric@lewagon.com").id
                            )

puts "adding pictures to #{workspace.name}"
file = URI.open("https://t19bis.ch/wp-content/uploads/sites/21/2018/09/coworking-haut-petit.jpg")
workspace.photo.attach(io: file, filename:"#{workspace.name}.png", content_type: 'image/png')


puts "creating Simon"
User.create!(
              email: "simon@lewagon.com",
              password: "123456",
              username: "simon",
              first_name: "Simon",
              last_name: "Buschs",
              role: "user"
)

puts "creating Ben"
User.create!(
              email: "ben@lewagon.com",
              password: "123456",
              username: "ben",
              first_name: "Ben",
              last_name: "Atieku",
              role: "user"
)

puts "creating Tenz"
User.create!(
              email: "tenzin@lewagon.com",
              password: "123456",
              username: "tenz",
              first_name: "Tenzin",
              last_name: "Gasser",
              role: "user"
)

puts "creating 5 random users"
5.times do
  User.create!(
                email: Faker::Internet.email,
                password: "123456",
                username: Faker::FunnyName.name,
                first_name: Faker::Name.first_name,
                last_name: Faker::Name.last_name,
                role: "user"
  )
end

10.times do
  puts "creating booking"
  office = Workspace.all.sample
  booking = Booking.create(
                          start_date: rand_dates[0],
                          end_date: rand_dates[1],
                          user_id: User.all.sample,
                          workspace_id: office.id,
                          total_price: office.daily_rate
                        )
end

puts "seeding done"
