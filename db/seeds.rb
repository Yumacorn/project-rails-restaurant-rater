# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: "Ryan", email: "r@gmail.com", username: "yuma", password: "Fix", age: 28, city: "Syosset", state: "NY")
User.create(name: "Adela", email: "a@gmail.com", username: "CoolestChews", password: "Fix", age: 25, city: "Oyster Bay", state: "NY")
User.create(name: "Jason", email: "j@gmail.com", username: "jumpingSnowboard", password: "Fix", age: 23, city: "Hauppauge", state: "NY")

Restaurant.create(name: "Taco Bell", city: "Bethpage", state: "NY", dine_in: true, take_out: true)
Restaurant.create(name: "Spice Workshop", city: "Syosset", state: "NY", dine_in: false, take_out: true)
Restaurant.create(name: "Kumo Sushi", city: "Stony Brook", state: "NY", dine_in: true, take_out: true)
Restaurant.create(name: "Bubba Gump", city: "Pembroke Pines", state: "FL", dine_in: true, take_out: false)
Restaurant.create(name: "Little Dumpling", city: "Tallahassee", state: "FL", dine_in: true, take_out: true)
Restaurant.create(name: "Alice's Wonderland", city: "Port Jefferson", state: "NY", dine_in: true, take_out: false)
Restaurant.create(name: "Romanao's Pizza Joint", city: "Hicksville", state: "NY", dine_in: false, take_out: true)
Restaurant.create(name: "California Pizza Kitchen", city: "Davon", state: "CA", dine_in: false, take_out: true)



Review.create(user_id: 1, restaurant_id: 1, rating: 5, dining_method: "Dine In", comment: "Service was fast and speedy, so very clean")
Review.create(user_id: 1, restaurant_id: 2, rating: 5, dining_method: "Take Out", comment: "This is authentic schezuean food! I'm definitely coming back here")
Review.create(user_id: 1, restaurant_id: 3, rating: 5, dining_method: "Dine In", comment: "Nice")
Review.create(user_id: 1, restaurant_id: 4, rating: 5, dining_method: "Take Out", comment: "Super duper!")
Review.create(user_id: 1, restaurant_id: 5, rating: 5, dining_method: "Take Out", comment: "My family liked it")
Review.create(user_id: 1, restaurant_id: 6, rating: 5, dining_method: "Dine In", comment: "We had our anniversary here!")
Review.create(user_id: 1, restaurant_id: 7, rating: 5, dining_method: "Take Out", comment: "Man I love food!")

Review.create(user_id: 2, restaurant_id: 1, rating: 2, dining_method: "Dine In", comment: "My table wasn't wiped down between orders")
Review.create(user_id: 2, restaurant_id: 2, rating: 5, dining_method: "Take Out", comment: "Pain is a flavor of chinese cuisine, this is a treat!")
Review.create(user_id: 2, restaurant_id: 7, rating: 5, dining_method: "Take Out", comment: "This place just opened!")
Review.create(user_id: 2, restaurant_id: 8, rating: 5, dining_method: "Dine In", comment: "Wish this was closer to my house!")

Review.create(user_id: 3, restaurant_id: 1, rating: 4, dining_method: "Take Out", comment: "They gave me too many napkins, but it was appreciated!")
Review.create(user_id: 3, restaurant_id: 3, rating: 4, dining_method: "Take Out", comment: "Def recommend!")
Review.create(user_id: 3, restaurant_id: 4, rating: 1, dining_method: "Dine In", comment: "They said a new owner took over. Bad move man")
Review.create(user_id: 3, restaurant_id: 5, rating: 2, dining_method: "Dine In", comment: "I couldn't use the bathroom because they didn't clean it")
Review.create(user_id: 3, restaurant_id: 8, rating: 1, dining_method: "Take Out", comment: "I'm coming back here never!")

# Test - Bad Data
# User.create(name: "Irene", username: "Wawa", password: "", age: "A", city: "Oyster Bay", state: "moo")
# Review.create(user_id: 1, restaurant_id: 2, rating: 5, dining_method: "Dine In", comment: "HOOO").errors