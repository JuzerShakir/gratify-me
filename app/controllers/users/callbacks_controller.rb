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
            redirect_to :root, notice: "The email address #{@user.email} you have logged in with is associated with #{@user.provider} in our database. You're now logged in through #{user.provider}"
        else
            redirect_to :root
        end
    end
end
