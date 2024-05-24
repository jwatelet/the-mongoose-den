module FollowsHelper
  def find_follow(user, followed_user)
    if user.nil?
      nil
    else
      user.find_follow_for(followed_user)
    end
  end
end
