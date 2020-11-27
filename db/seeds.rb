puts "seeding in process"

def rand_dates
  # return a random date within 30 days of today in both past and future directions.
  n = rand(0..30)
  m  = n + rand(0..5)
  date_1 = Date.today.advance(days: n)
  date_2 = Date.today.advance(days: m)
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
eric = User.create!(
  email: "eric@lewagon.com",
  password: "123456",
  username: "eric",
  first_name: "Eric",
  last_name: "Blandet",
  role: "owner"
)
puts "adding picture to Eric"
file = URI.open("https://avatars2.githubusercontent.com/u/67010824?s=460&u=37630e834c389cd219c9e00e5ee8978997a79bd4&v=4")
eric.photo.attach(io: file, filename:"eric.png", content_type: 'image/png')

puts "1 - adding The Office"
workspace = Workspace.create!(name:"The Office",
                              description:"Where creativity comes true, a nice a cosy little coworking space. It's like home",
                              address:"Avenue de Sévelin 13B, Lausanne, Switzerland",
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
                              address:"Avenue de la gare, Lausanne, Switzerland",
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
                              address:"Rue de Médran 3, 1936 Verbier, Switzerland",
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
                              address:"Chemin du Closel 5, 1020 Renens, Switzerland",
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
                              address:"Avenue de Sévelin 52, 1004 Lausanne, Switzerland",
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
                              address:"Rue du Liseron 7, 1006 Lausanne, Switzerland",
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
                              address:"Avenue de Rhodanie 54, 1007 Lausanne, Switzerland",
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
                              address:"PASSAGE ST-FRANÇOIS 9, CH-1003 LAUSANNE, Switzerland",
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
                              address:"Rue du Jura 11, CH - 1004 Lausanne, Switzerland",
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
                              address:"Rue Etraz 4, CH-1003 Lausanne, Switzerland",
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
                              address:"Avenue de Tivoli 19bis – 1007 Lausanne, Switzerland",
                              capacity: 16,
                              daily_rate: 39,
                              user_id: User.find_by(email:"eric@lewagon.com").id
                            )

puts "adding pictures to #{workspace.name}"
file = URI.open("https://t19bis.ch/wp-content/uploads/sites/21/2018/09/coworking-haut-petit.jpg")
workspace.photo.attach(io: file, filename:"#{workspace.name}.png", content_type: 'image/png')

puts "12 - adding Dojo Bali"
workspace = Workspace.create!(name:"Dojo Bali",
                              description:"Discover Dojo Coworking Bali.
                              The best place to work and enjoy life.
                              Close to the sea, we have a huge community of digital nomads working here daily",
                              address:"Canggu, bali",
                              capacity: 50,
                              daily_rate: 12,
                              user_id: User.find_by(email:"eric@lewagon.com").id
                            )

puts "adding pictures to #{workspace.name}"
file = URI.open("https://www.mime.asia/wp-content/uploads/2020/05/1-11.jpg")
workspace.photo.attach(io: file, filename:"#{workspace.name}.png", content_type: 'image/png')

puts "13 - adding Coworking LA"
workspace = Workspace.create!(name:"Le Café L.A.",
                              description:"Peaceful, high end coworking space in the city center of LA.
                              ",
                              address:"Los Angeles, USA",
                              capacity: 100,
                              daily_rate: 100,
                              user_id: User.find_by(email:"eric@lewagon.com").id
                            )

puts "adding pictures to #{workspace.name}"
file = URI.open("https://miro.medium.com/max/2560/1*wtRpSxtyE0q5Ox44wY5zMQ.jpeg")
workspace.photo.attach(io: file, filename:"#{workspace.name}.png", content_type: 'image/png')

puts "14 - adding Wojo Lyon"
workspace = Workspace.create!(name:"Wojo Lyon",
                              description:"Notre espace évolutif pour entrepreneurs propose au sein de ses espaces, des bureaux privatifs et des postes en coworking
                              Idéalement, situé sur la presqu’ile de Lyon Paris 2, sur les quais entre le pont Lafayette et le pont Wilson. Métro Cordeliers.
                              ",
                              address:"8 quai Jules Courmont, 69000 Lyon, France",
                              capacity: 25,
                              daily_rate: 34,
                              user_id: User.find_by(email:"eric@lewagon.com").id
                            )

puts "adding pictures to #{workspace.name}"
file = URI.open("https://pictshare.wojo.com/7bfe02.jpg")
workspace.photo.attach(io: file, filename:"#{workspace.name}.png", content_type: 'image/png')

puts "15 - Empower Office Suites"
workspace = Workspace.create!(name:"Empower Office Suites",
                              description:"A fully furnished and equipped workspace located in a prime location within the main Central Business District in Accra. Empower Office Suites is bordered by major hotels like Movenpick, Kempinski as well as Accra City Hotel. We are less than half-hour from the Airport and Accra-Tema motorway.
                              ",
                              address:"Barnes Road, Accra, Ghana",
                              capacity: 23,
                              daily_rate: 54,
                              user_id: User.find_by(email:"eric@lewagon.com").id
                            )

puts "adding pictures to #{workspace.name}"
file = URI.open("https://cdn-images.welcometothejungle.com/dX7VRoI9ZdXua3-pj5dFgxrUPHo7KYiY9Y_vf-p4Enk/rs:auto:1500::/q:85/czM6Ly93dHRqLXByb2R1Y3Rpb24vdXBsb2Fkcy9hcnRpY2xlL2ltYWdlLzQ0NzcvMTUwNTc0L2xlcy1tZWlsbGV1cnMtZXNwYWNlcy1kZS1jb3dvcmtpbmctYS1seW9uLmpwZw")
workspace.photo.attach(io: file, filename:"#{workspace.name}.png", content_type: 'image/png')

puts "16 - The Hub Chiang Mai"
workspace = Workspace.create!(name:"The Hub Chiang Mai",
                              description:"The Hub Chiang Mai is a coworking space dedicated to sustainability, experiential learning, and community. The difference between The Hub Chiang Mai and most other coworking spaces, however, is that The Hub really does live by its values.",
                              address:"Chiang Mai, Thailand",
                              capacity: 33,
                              daily_rate: 12,
                              user_id: User.find_by(email:"eric@lewagon.com").id
                            )

puts "adding pictures to #{workspace.name}"
file = URI.open("https://www.coworker.com/mag/wp-content/uploads/2018/08/31944381_1882905511760926_7811814984731590656_o.jpg")
workspace.photo.attach(io: file, filename:"#{workspace.name}.png", content_type: 'image/png')


puts "17 - The commons"
workspace = Workspace.create!(name:"The commons",
                              description:"Our mission is to provide an environment that allows businesses to connect and grow, and we achieve this through continuous research and mindful consideration of every aspect within our spaces.",
                              address:"3 Albert Coates Ln, Melbourne VIC 3000, Australia",
                              capacity: 23,
                              daily_rate: 54,
                              user_id: User.find_by(email:"eric@lewagon.com").id
                            )

puts "adding pictures to #{workspace.name}"
file = URI.open("https://thecommons.com.au/app/uploads/3.-Our-Spaces-2-1024x684.jpg")
workspace.photo.attach(io: file, filename:"#{workspace.name}.png", content_type: 'image/png')



puts "18 - The Thinking Hut"
workspace = Workspace.create!(name:"The Thinking Hut",
                              description:"Make a home for your business with a Regus private office. Our fully equipped workspaces have everything taken care of – from the furniture to the high-speed WiFi – so you can focus on driving your business forward.",
                              address:"Amsterdam, Netherlands",
                              capacity: 13,
                              daily_rate: 74,
                              user_id: User.find_by(email:"eric@lewagon.com").id
                            )

puts "adding pictures to #{workspace.name}"
file = URI.open("https://media-exp1.licdn.com/dms/image/C561BAQFftgtfvtAY6Q/company-background_10000/0?e=2159024400&v=beta&t=UjQpPk8fkVmVZMOhMDWEplGbaIV3__s-_Tsdwmhvt_k")
workspace.photo.attach(io: file, filename:"#{workspace.name}.png", content_type: 'image/png')


puts "19 - Hot desks"
workspace = Workspace.create!(name:"Hot desks",
                              description:"A fully furnished and equipped workspace located in a prime location within the main Central Business District in Accra. Empower Office Suites is bordered by major hotels like Movenpick, Kempinski as well as Accra City Hotel. We are less than half-hour from the Airport and Accra-Tema motorway.
                              ",
                              address:"Boulevard du Souverain 24, 1170 Watermael-Boitsfort, Belgique",
                              capacity: 63,
                              daily_rate: 47,
                              user_id: User.find_by(email:"eric@lewagon.com").id
                            )

puts "adding pictures to #{workspace.name}"
file = URI.open("https://images.freeimages.com/images/large-previews/54e/maneken-piss-1253573.jpg")
workspace.photo.attach(io: file, filename:"#{workspace.name}.png", content_type: 'image/png')


puts "20 - Le 10h10"
workspace = Workspace.create!(name:"Le 10h10",
                              description:"Au 10h10 Coworking Café, nous avons voulu créer un café
                              pour travailler, lire, partager, échanger...
                              Nous croyons que la créativité se développe davantage dans une atmosphère conviviale et esthétique, que dans un cadre standardisé et impersonnel.
                              Chaque espace est donc conçu pour favoriser la création, les rencontres,
                              la collaboration, mais aussi la flânerie et la détente.",
                              address:"210, rue Saint Martin, 75003 Paris, France",
                              capacity: 25,
                              daily_rate: 25,
                              user_id: User.find_by(email:"eric@lewagon.com").id
                            )

puts "adding pictures to #{workspace.name}"
file = URI.open("https://www.google.com/maps/uv?pb=!1s0x47e66e1bad0f1f05%3A0x784a20b75ff52ec9!3m1!7e115!4shttps%3A%2F%2Flh5.googleusercontent.com%2Fp%2FAF1QipNGqhqHr7_zQoYyz2NVs_9V5FmKS5_EuyttbqYT%3Dw260-h175-n-k-no!5s10h10%20caf%C3%A9%20-%20Recherche%20Google!15sCgIgAQ&imagekey=!1e10!2sAF1QipNGqhqHr7_zQoYyz2NVs_9V5FmKS5_EuyttbqYT&hl=fr#")
workspace.photo.attach(io: file, filename:"#{workspace.name}.png", content_type: 'image/png')

puts "creating Simon"
simon = User.create!(
              email: "simon@lewagon.com",
              password: "123456",
              username: "simon",
              first_name: "Simon",
              last_name: "Buschs",
              role: "user"
)

puts "adding picture to Simon"
file = URI.open("https://avatars1.githubusercontent.com/u/59468684?s=460&u=6cb043be59da4fa4c66a626e7e4e6404d821c37f&v=4")
simon.photo.attach(io: file, filename:"eric.png", content_type: 'image/png')

puts "creating Ben"
ben = User.create!(
              email: "ben@lewagon.com",
              password: "123456",
              username: "ben",
              first_name: "Ben",
              last_name: "Atieku",
              role: "user"
)

puts "adding picture to Ben"
file = URI.open("https://avatars2.githubusercontent.com/u/66464884?s=460&u=e13b5ce4c4512553ce3f474ac9ce9db44a7a0307&v=4")
ben.photo.attach(io: file, filename:"ben.png", content_type: 'image/png')

puts "creating Tenz"
tenz = User.create!(
              email: "tenzin@lewagon.com",
              password: "123456",
              username: "tenz",
              first_name: "Tenzin",
              last_name: "Gasser",
              role: "user"
)

puts "adding picture to Tenz"
file = URI.open("https://avatars2.githubusercontent.com/u/72730792?s=460&u=9aeda3ffe37fbf809178c956240333d8d37ca15d&v=4")
tenz.photo.attach(io: file, filename:"tenz.png", content_type: 'image/png')

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
  booking_dates = rand_dates
  puts "#{booking_dates[0]} to #{booking_dates[1]}"
  number_of_persons = rand(1..3)
  booking = Booking.create!(
                          start_date: booking_dates[0],
                          end_date: booking_dates[1],
                          user_id: User.all.sample.id,
                          workspace_id: office.id,
                          number_of_persons: number_of_persons,
                          total_price: office.daily_rate * (booking_dates[1] - booking_dates[0] + 1) * number_of_persons
                        )
end

puts "seeding done"
