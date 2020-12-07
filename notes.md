Temporarily removed from line 9 of application.html.erb of a webpacker issue
    <%= javascript_pack_tag 'application', 'data-turbolinks-track': true %>
app\views\layouts\application.html.erb

Restaurant Rater
Design:
User has_many reviews
    -Name
    -Username
    -password_digest
    -age
    -city
    -state
    -has_many restaurants, through: reviews
Restaurant has_many reviews
    -Name
    -city
    -state
    -dine_in
    -take_out
    -has_many user, through: reviews
Review belongs_to user, belongs_to restaurant
    -user_id
    -restaurant_id
    -rating:integer
    -dining_method: dine_in, take_out
    -comment:text

-Add # of ratings, and average rating per restaurant
-Add # of ratings by User
-Implement sign in/out/authentication via facebook
-restrict users from editing/deleting posts that aren't their own
-In order to make a review, must be logged in
-When making a review, automatically pull user_id
-when making a review, limit range of rating 1-5
 

