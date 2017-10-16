module UsersHelper
  def gravatar_for user, options = { size: 50 }
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}.png"
    image_tag(gravatar_url, alt: user.username, class: "gravatar")
  end

  def gravatar_link user
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}.png"
    gravatar_url
  end

  def get_avatar user
    if user.avatar != nil
      user.avatar
    else
      gravatar_link user
    end
  end
end
