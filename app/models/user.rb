class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tweets, dependent: :destroy

  has_many :likes , dependent: :destroy
  has_many :liked_tweets, through: :likes, source: :tweet

  has_many :follower_relationships, foreign_key: :following_id, class_name: 'Follow'
  has_many :followers, through: :follower_relationships, source: :follower

  has_many :following_relationships, foreign_key: :follower_id, class_name: 'Follow'
  has_many :following, through: :following_relationships, source: :following

  validates :username, uniqueness: { case_sensitive: false }, presence: true

  def follow(user_id)
    return if self.following.include?(User.find(user_id))
    following_relationships.create(following_id: user_id)
  end

  def unfollow(user_id)
    following_relationships.find_by(following_id: user_id).destroy
  end

  def get_tweets_by_following
    following.map(&:tweets).flatten.concat(tweets).sort_by { |item| item.created_at }.reverse
  end
end
