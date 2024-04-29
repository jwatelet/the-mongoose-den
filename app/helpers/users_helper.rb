module UsersHelper
  def profile_image(user, size = 80, is_rounded = false)
    url = "https://secure.gravatar.com/avatar/#{user.gravatar_id}?s=#{size}"
    if is_rounded
      image_tag(url, alt: user.username, class: "is-rounded")
    else
      image_tag(url, alt: user.username)
    end
  end
end
