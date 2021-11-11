class Users::RegistrationsController < Devise::RegistrationsController
  private
  def signup_params
     params.require(:user).permit( :provider, :uid, :email,
                                    :password, :password_confirmation)
  end
end
