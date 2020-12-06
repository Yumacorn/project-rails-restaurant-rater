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


