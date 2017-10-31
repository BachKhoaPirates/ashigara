class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :omniauthable, :omniauth_providers => [:facebook, :google_oauth2]

  has_many :bookmarks
  has_many :reviews

  def self.from_omniauth(auth)
    user = where(email: auth.info.email).first_or_create do |u|
      u.password = Devise.friendly_token[0,20]
      u.email = auth.info.email
      u.avatar = auth.info.image.gsub('http://','https://')
      u.username = auth.info.name
      u.skip_confirmation!
      u.save!
    end

    # if (!user.avatar.url)
    #   user.remote_avatar_url = auth.info.image.gsub('http://', 'https://')
    # end
    return user
  end

  def current_user? user
    self == user
  end

  def has_vote?(review_id)
    Vote.exists?(user_id: self.id, review_id: review_id)
  end

  def add_vote?(review_id)
    if has_vote?(review_id)
      return false
    else
      Vote.create!(user_id: self.id, review_id: review_id)
    end

  end

  def delete_vote?(review_id)
    unless has_vote?(review_id)
      return false
    else
      Vote.where(user_id: self.id, review_id: review_id).delete_all
      return true
    end
  end

end
