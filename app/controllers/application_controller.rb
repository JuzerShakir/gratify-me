class ApplicationController < ActionController::Base
  # to enable logistics for pagination in controllers
  include Pagy::Backend

  # since we have given a few new attributes to our user table, we need to tell devise to enable params for it
  # to override default params of devises' User controller, run the method only if its a controller of a devise
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
    # we give list of editable attributes to user both while signing up and updating profile
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :age, :birth_date, :gender, :avatar]) # for update
      devise_parameter_sanitizer.permit(:sign_up, keys: [:provider, :uid, :email, :password, :password_confirmation]) # for signup
    end
end
