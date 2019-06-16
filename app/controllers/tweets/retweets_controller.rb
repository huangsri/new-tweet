class Tweets::RetweetsController < ApplicationController
  def new
  end

  def create
    parent_tweet = Tweet.find(params[:tweet_id])
    tweet = current_user.tweets.new(tweet_params)
    tweet.content = parent_tweet.content
    if parent_tweet.replies << tweet
      redirect_to tweet_path(tweet)
    else
    end
  end

  private
  def tweet_params
    params.required(:tweet).permit(:retweet_content)
  end
end