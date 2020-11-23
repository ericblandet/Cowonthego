# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Workspace.destroy_all

w1 = Workspace.create(name:"studio 506", description:"best office in LS", address:"avenue de Sévelin, Lausanne", capacity: 4, daily_rate:25, user_id:1)
w2 = Workspace.create(name:"The Office", description:"where creativity comes true", address:"Chemin du closel, Lausanne", capacity: 12, daily_rate:50, user_id:1)
puts w1
puts w2