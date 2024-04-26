module UsersHelper
  def profile_image(user, size = 80)
    url = "https://secure.gravatar.com/avatar/#{user.gravatar_id}?s=#{size}"
    image_tag(url, alt: user.username, class: "is-rounded")
  end
end
