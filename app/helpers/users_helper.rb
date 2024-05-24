module UsersHelper
  def profile_image(user, size = 80, is_rounded = false)
    url = generate_url(user, size)
    if is_rounded
      image_tag(url, alt: generate_alt(user), class: "is-rounded")
    else
      image_tag(url, alt: generate_alt(user))
    end
  end

  private

  def generate_alt(user)
    if user.nil?
      ""
    else
      user.username
    end
  end

  def generate_url(user, size)
    if user.nil?
      "https://secure.gravatar.com/avatar/?d=mp&s=#{size}"
    else
      "https://secure.gravatar.com/avatar/#{user.gravatar_id}?s=#{size}"
    end
  end
end
