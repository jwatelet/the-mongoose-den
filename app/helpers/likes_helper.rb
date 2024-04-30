module LikesHelper
  def like?(likeable)
    Like.where(likeable:, liker: current_user).present?
  end

  def like(likeable)
    Like.find_by(likeable:, liker: current_user)
  end
end
