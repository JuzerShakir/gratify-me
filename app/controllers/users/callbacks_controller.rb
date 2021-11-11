class Users::CallbacksController < Devise::OmniauthCallbacksController
    def google_oauth2
        @user = User.from_omniauth(request.env["omniauth.auth"])
        sign_in @user
        #session[:user_id] = @user.id
        redirect_to :root
    end

    def github
        @user = User.from_omniauth(request.env["omniauth.auth"])
        unless sign_in @user
            redirect_to :root, alert: 'The email your trying to login with is already in use. You may have signed earlier with a different provider'
        end
        redirect_to :root
    end
end
