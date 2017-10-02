class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :omniauthable, :omniauth_providers => [:facebook, :google_oauth2]


  def self.from_omniauth(auth)
    user = where(email: auth.info.email).first_or_create do |user|
      user.password = Devise.friendly_token[0,20]
      user.email = auth.info.email
      # user.remote_avatar_url = auth.info.image.gsub('http://','https://')
      user.skip_confirmation!
      user.save!
    end

    # if (!user.avatar.url)
    #   user.remote_avatar_url = auth.info.image.gsub('http://', 'https://')
    # end
    return user
  end
end
