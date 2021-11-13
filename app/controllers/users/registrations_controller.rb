class Users::RegistrationsController < Devise::RegistrationsController
  private
  def signup_params
     params.require(:user).permit( :provider, :uid, :email,
                                    :password, :password_confirmation)
  end

  protected

  def update_resource(resource, params)
    resource.update_without_password(params)
  end
end
