class Users::CallbacksController < Devise::OmniauthCallbacksController
    def google_oauth2
        @user = User.from_omniauth(request.env["omniauth.auth"])
        sign_in @user
        #session[:user_id] = @user.id
        redirect_to :root
    end

    def github
        @user = User.from_omniauth(request.env["omniauth.auth"])
        if @user.provider != 'github'
            redirect_to :root, alert: 'NoNO'
        else
            sign_in @user
            redirect_to :root
        end
    end
end
