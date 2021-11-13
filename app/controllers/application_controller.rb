class ApplicationController < ActionController::Base
  #protect_from_forgery with: :exception
  #before_action :authenticate_user!

  # to override default params of devise, run the method only if its a controller of devise
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
    # we give list of editable attributes to user both while signing up and  updating profile
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :age, :birth_date, :gender]) # for update
      devise_parameter_sanitizer.permit(:sign_up, keys: [:provider, :uid, :email, :password, :password_confirmation]) # for signup
    end
end
