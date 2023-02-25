class Users::CallbacksController < Devise::OmniauthCallbacksController
    # a callback before running any provider function
    before_action :load_user


    # respective provider function will run based on what provider user logged in from
    def google_oauth2
        # __method__ will provide us with the name of the provider he logged in from
        # then we apply a regexp to match the with the name set in database

        # we call function to check if user has logged in from correct provider
        check_provider(__method__.match(/[a-z]+/).to_s.capitalize)
    end

    def github
        check_provider(__method__.to_s.capitalize)
    end

    def twitter
        check_provider(__method__.to_s.capitalize)
    end


    private

        # this function will load user from social app or provider and sign them in through devise function sign_in
        def load_user
            # 'from_omniauth' defined in user model
            # request.env loads user details from the provider
            @user = User.from_omniauth(request.env["omniauth.auth"])

            # if user has been returned by the model then sign them in else redirect them to root with a message
            if @user.nil?
                redirect_to :root, flash: { headsup: "Uh Oh, a technical error has occured!" }
            else
                sign_in @user
            end
        end

        def check_provider(provider_method)
            # user is now logged in
            # if provider value of a user from database matches the provider name he logged in from ..
            if @user.provider == provider_method
                #..then show him a successful login message
                redirect_to :root, notice: 'Signed in successfully!'
            else
                # else show message that user has logged in from wrong provider
                redirect_to :root, flash: { headsup: "The email address you have logged in with is already associated with #{@user.provider} in our database. Hence, you're logged in via #{@user.provider}"}
            end
        end
end
