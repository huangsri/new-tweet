class AddPublishAtToTweets < ActiveRecord::Migration[5.2]
  def change
    add_column :tweets, :publish_at, :datetime
  end
end
