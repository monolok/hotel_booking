# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Room.create(name: "Ocean-view", 	type_room: "suitemaster", 	price: 150)
Room.create(name: "Garden-view", 	type_room: "medium", 		price: 120)
Room.create(name: "Street-view", 	type_room: "small", 		price: 80)
Room.create(name: "Last-floor", 	type_room: "premium-suite", price: 230)
Room.create(name: "Cosy", 			type_room: "small",			price: 80)
Room.create(name: "Familly", 		type_room: "large", 		price: 99)