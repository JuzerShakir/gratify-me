class Users::RegistrationsController < Devise::RegistrationsController

  # params given in ApplicationController file

  protected
  # by default devise wants a password to save updated attribute values in edit form
  # since we dont want password, we tell devise about it by giving a method
    def update_resource(resource, params)
      resource.update_without_password(params)
    end
end
