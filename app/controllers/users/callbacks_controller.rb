class Users::CallbacksController < Devise::OmniauthCallbacksController
    def google_oauth2
        @user = User.from_omniauth(request.env["omniauth.auth"])
        sign_in @user
        #session[:user_id] = @user.id
        redirect_to :root
    end

    def github
        @user = User.from_omniauth(request.env["omniauth.auth"])
        if User.find_by(email: @user.email)
            alert  'The email your trying to login with is already in use. You may have signed earlier with a different provider'
            redirect_to 'youtube.com'
        end

    end
end
