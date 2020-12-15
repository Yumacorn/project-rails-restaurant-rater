
[1mFrom:[0m /mnt/c/Users/Reach/dev/flatiron/project/project-rails-restaurant-rater/app/controllers/sessions_controller.rb:11 SessionsController#create:

     [1;34m6[0m: [32mdef[0m [1;34mcreate[0m
     [1;34m7[0m:   binding.pry
     [1;34m8[0m:   [32mif[0m request.env[[31m[1;31m"[0m[31momniauth.auth[1;31m"[0m[31m[0m]
     [1;34m9[0m:     pp request.env[[31m[1;31m'[0m[31momniauth.auth[1;31m'[0m[31m[0m]
    [1;34m10[0m:     @user = [1;34;4mUser[0m.from_omniauth(auth)
 => [1;34m11[0m:     binding.pry
    [1;34m12[0m:     [32mif[0m @user.save
    [1;34m13[0m:       session[[33m:user_id[0m] = @user.id
    [1;34m14[0m:     [32mend[0m
    [1;34m15[0m:   [32melse[0m
    [1;34m16[0m:     [1;34m# user login via non omniauth[0m
    [1;34m17[0m:     user = [1;34;4mUser[0m.find_by([35musername[0m: params[[33m:username[0m])
    [1;34m18[0m:     authenticated = user.try([33m:authenticate[0m, params[[33m:password[0m])
    [1;34m19[0m:     [32mreturn[0m head([33m:forbidden[0m) [32munless[0m authenticated
    [1;34m20[0m:     @user = user
    [1;34m21[0m:     session[[33m:user_id[0m] = @user.id
    [1;34m22[0m:   [32mend[0m
    [1;34m23[0m:   redirect_to [31m[1;31m'[0m[31m/[1;31m'[0m[31m[0m
    [1;34m24[0m: [32mend[0m

