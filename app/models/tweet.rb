class Tweet < ApplicationRecord
  belongs_to :user

  has_many :likes
  has_many  :liking_users, through: :likes, source: :user

  belongs_to :parent, class_name: "Tweet", foreign_key: :parent_id, optional: true
  has_many :replies, class_name: "Tweet", foreign_key: :parent_id
  has_many :retweets, class_name: "Tweet", foreign_key: :parent_id, dependent: :destroy

  validates :content, presence: true

end
