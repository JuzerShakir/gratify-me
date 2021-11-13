class User < ApplicationRecord
  has_one_attached :avatar

  enum gender: [:undisclosed, :female, :male, :other]

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :rememberable, :validatable, :omniauthable, omniauth_providers: %i[github google_oauth2 twitter]

  def self.from_omniauth(auth)
    where(email: auth.info.email).first_or_create do | user |
      user.provider = auth.provider.match(/[a-z]+/).to_s.capitalize
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token
    end

  end
end
