# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  confirmation_sent_at   :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  failed_attempts        :integer          default(0), not null
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :string
#  locked_at              :datetime
#  provider               :string(50)       default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  sign_in_count          :integer          default(0), not null
#  uid                    :string(50)       default(""), not null
#  unconfirmed_email      :string
#  unlock_token           :string
#  username               :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_unlock_token          (unlock_token) UNIQUE
#
class User < ApplicationRecord
  paginates_per 10

  has_many :posts, foreign_key: "author_id", inverse_of: "author", dependent: :destroy
  has_many :comments, foreign_key: "commenter_id", inverse_of: "commenter", dependent: :destroy
  has_many :likes, foreign_key: "liker_id", inverse_of: "liker", dependent: :destroy

  has_many :follower_relationships, foreign_key: :followed_user_id, class_name: "Follow", inverse_of: "follower",
                                    dependent: :destroy
  has_many :followers, through: :follower_relationships, source: :follower

  has_many :followed_user_relationships, foreign_key: :follower_id, class_name: "Follow", inverse_of: "followed_user",
                                         dependent: :destroy
  has_many :followed_users, through: :followed_user_relationships, source: :followed_user

  # Include default devise modules. Others available are:
  #  :timeoutable,
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable, :confirmable, :lockable,
         :omniauthable, omniauth_providers: %i[github google_oauth2]

  validates :username, presence: true

  def self.create_from_github(provider_data)
    where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do |user|
      user.email = provider_data.info.email
      user.username = provider_data.info.nickname
      user.password = Devise.friendly_token[0, 20]
      user.confirmation_token = nil
      user.confirmed_at = Time.now
    end
  end

  def self.create_from_google(provider_data)
    where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do |user|
      user.email = provider_data.info.email
      user.username = provider_data.info.name
      user.password = Devise.friendly_token[0, 20]
      user.confirmation_token = nil
      user.confirmed_at = Time.now
    end
  end

  def gravatar_id
    Digest::MD5.hexdigest(email.downcase)
  end

  def find_follow_for(user)
    followed_user_relationships.find_by(followed_user: user)
  end

  def follows?(user)
    followed_users.where(followed_user: user).present?
  end
end
