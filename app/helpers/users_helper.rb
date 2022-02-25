module UsersHelper

  # Returns the gravatar for a given user

  def gravatar_for(user, options = { size: 40 })
    size = options[:size]
    gravatar_id = Digest::MD5::hexdigest(user.email)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?d=monsterid&s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end
end
