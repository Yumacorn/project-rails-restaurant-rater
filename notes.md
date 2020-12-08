Temporarily removed from line 9 of application.html.erb of a webpacker issue
    <%= javascript_pack_tag 'application', 'data-turbolinks-track': true %>
app\views\layouts\application.html.erb
-webpacker??


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

-Implement sign in/out/authentication via facebook: Omniauth
    -In order to make a review, must be logged in
    -sessions resource

-restrict users from editing/deleting posts that aren't their own*Guard Data* CanCanCan
    -When making a review, automatically pull user_id
    if user not current user, can/can't before_action, cancancan gem

-nested attributes for user/reviews, restaurant/reviews (acceps_nested_attributes)
    -Restaurant.find_or_create_by(params)
    
-search/scope FILTER by City/state
***Stretch - Follow other users? Favorite their reviews?

-Footer
***Fixed unexpected behavior on Review Index, obscures viewport

 

