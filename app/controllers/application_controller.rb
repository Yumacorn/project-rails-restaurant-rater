class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?

    private
        def authentication_required
            if !logged_in?
                redirect_to login_path
            end
        end

        def logged_in?
            !!session[:user_id]
        end

        def current_user
            session[:user_id]
        end
end
