# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: "Ryan", username: "yuma", age: 28, city: "Syosset", state: "NY")
User.create(name: "Adela", username: "chews", age: 25, city: "Oyster Bay", state: "NY")
User.create(name: "Jason", username: "graz", age: 23, city: "Syosset", state: "NY")

# Test - Bad Data
User.create(name: "Irene", username: "Wawa", age: "A", city: "Oyster Bay", state: "NY")


Restaurant.create(name: "Taco Bell", city: "Bethpage", state: "NY", dine_in: true, take_out: true)
Restaurant.create(name: "Spice Workshop", city: "Syosset", state: "NY", dine_in: false, take_out: true)

Review.create(user_id: 1, restaurant_id: 1, rating: 5, dining_method: "Take Out", comment: "Service was fast and speedy, so very clean")
Review.create(user_id: 2, restaurant_id: 1, rating: 2, dining_method: "Dine In", comment: "My table wasn't wiped down between orders")
Review.create(user_id: 3, restaurant_id: 1, rating: 4, dining_method: "Take Out", comment: "They gave me too many napkins, but it was appreciated!")
Review.create(user_id: 1, restaurant_id: 2, rating: 5, dining_method: "Take Out", comment: "This is authentic schezuean food! I'm definitely coming back here")
Review.create(user_id: 2, restaurant_id: 2, rating: 4, dining_method: "Take Out", comment: "Pain is a flavor of chinese cuisine, this is a treat!")

