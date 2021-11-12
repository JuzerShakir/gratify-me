class Users::CallbacksController < Devise::OmniauthCallbacksController
    def google_oauth2
        @user = User.from_omniauth(request.env["omniauth.auth"])
        sign_in @user
        #session[:user_id] = @user.id
        redirect_to :root
    end

    def github
        @user = User.from_omniauth(request.env["omniauth.auth"])
        sign_in @user
        if @user.provider != 'github'
            flash[:headsup] = "The email address you have logged in with is associated with #{@user.provider} in our database. Hence, you're logged in via #{@user.provider}"
            redirect_to :root
        else
            redirect_to :root
        end
    end
end
