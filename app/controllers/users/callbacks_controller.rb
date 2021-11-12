class Users::CallbacksController < Devise::OmniauthCallbacksController
    before_action :load_user
    after_action :show_user

    def google_oauth2
        @method_name = __method__.match(/[a-z]+/).to_s.capitalize
    end

    def github
        @method_name = __method__.to_s.capitalize
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

    def show_user
        if  @user.provider != @method_name
            existing_user
        else
            new_user
        end
    end
end
