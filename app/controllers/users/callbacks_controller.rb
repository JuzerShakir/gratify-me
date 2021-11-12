class Users::CallbacksController < Devise::OmniauthCallbacksController
    before_action :load_user

    def google_oauth2
        existing_user if  @user.provider != __method__.match(/[a-z]+/).to_s.capitalize
        new_user
    end

    def github
        existing_user if  @user.provider != __method__.to_s.capitalize
        new_user
    end

    private

    def load_user
        @user = User.from_omniauth(request.env["omniauth.auth"])
        sign_in @user
    end

    def existing_user
        redirect_to :root, flash: { headsup: "The email address you have logged in with is already associated with #{@user.provider} in our database. Hence, you're logged in via #{@user.provider}"}
    end

    def new_user
        redirect_to :root, notice: 'Signed in successfully!'
    end
end
