class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :timeoutable,
         :trackable, :lockable, :confirmable, :omniauthable, omniauth_providers: [:google_oauth2]

  # def self.from_omniauth(auth)
  #   where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
  #     user.email = auth.info.email
  #     user.password = Devise.friendly_token(20)
  #     user.full_name = auth.info.name
  #     user.avatar = auth.info.image
  #     # Skip confirmation since Google has already confirmed the email address
  #     user.skip_confirmation!
  #   end
  # end

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first
    user ||= User.create(
      email: data['email'],
      password: Devise.friendly_token(20),
      full_name: data['name'],
      avatar: data['image']
    )
    user
  end
end
