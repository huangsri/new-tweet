class Tweet < ApplicationRecord
  belongs_to :user

  has_many :likes
  has_many  :liking_users, through: :likes, source: :user

  belongs_to :parent, class_name: "Tweet", foreign_key: :parent_id, optional: true
  has_many :replies, class_name: "Tweet", foreign_key: :parent_id
  has_many :retweets, class_name: "Tweet", foreign_key: :parent_id, dependent: :destroy

  validates :content, presence: true

  acts_as_taggable_on :tags
  ActsAsTaggableOn.force_lowercase = true

  before_save :add_tags

  private
  def add_tags
    self.tag_list = extract_hash(self.content)
  end
  
  def extract_hash(string)
    regex = /(?:|^)#[A-Za-z0-9\-\.]+(?:|$)/
    string.scan(regex).map { |item| item.gsub(/#/, "") }
  end

end
