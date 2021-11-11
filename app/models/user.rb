class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :rememberable, :validatable, :omniauthable, omniauth_providers: %i[github google_oauth2]

  def self.from_omniauth(auth)
    where(email: auth.info.email).first_or_create do | user |
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token
    end

  end
end
