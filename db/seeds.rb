puts "seeding in process"

def rand_date
  # return a random date within 100 days of today in both past and future directions.
  n = rand(0..60)
  Date.today.advance(days: n)
end


10.times do
  puts "create user"
  user = User.create(
    email: Faker::Internet.email,
    password: "password123",
    username: Faker::FunnyName.name,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    role: "user"
  )
  puts "create workspace"
  workspace = Workspace.create(
    name: Faker::Commerce.material,
    description: "coworking space",
    address: Faker::Address.state,
    capacity: rand(5..20),
    daily_rate: rand(50..100),
    user_id: user.id
  )
  puts "create booking"
  booking = Booking.create(
    start_date: rand_date,
    end_date: rand_date,
    user_id: user.id,
    workspace_id: workspace.id,
    total_price: workspace.daily_rate
  )
end




puts "seeding done"

# w1 = Workspace.create(name:"studio 506", description:"best office in LS", address:"avenue de Sévelin, Lausanne", capacity: 4, daily_rate:25, user_id:1)
# w2 = Workspace.create(name:"The Office", description:"where creativity comes true", address:"Chemin du closel, Lausanne", capacity: 12, daily_rate:50, user_id:1)
# puts w1
# puts w2
