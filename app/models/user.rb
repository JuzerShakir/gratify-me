class User < ApplicationRecord
  # for user avatar using active storage
  has_one_attached :avatar
  # Joining user model with says model with a has_many-belongs to relationship
  has_many :says, dependent: :destroy
  # setting an attribute as enum where it can have only these values in specific
  enum gender: [:undisclosed, :female, :male, :other]

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :rememberable, :validatable, :omniauthable, omniauth_providers: %i[github google_oauth2 twitter]


  # since we are using omniauth for loggin user in
  # auth is a hash type passed from Callbacks Controller
  def self.from_omniauth(auth)
    # rescues from the error message "undefined method 'info' on NilClass"
    unless auth.nil?
      # we want to know if users' email is already in our database, since we want unique emails in our database regardless of provider he/she uses
      # if user is in our database, load that user, if user doesn't exist then create one
      where(email: auth.info.email).first_or_create do | user |
        # following will run for new user, as it sets our database attributes with the value hash provides
        user.provider = auth.provider.match(/[a-z]+/).to_s.capitalize
        user.uid = auth.uid
        user.email = auth.info.email
        user.password = Devise.friendly_token
      end
    end

  end
end
