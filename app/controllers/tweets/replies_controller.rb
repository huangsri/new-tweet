class Tweets::RepliesController < ApplicationController
  def new
    @tweet = Tweet.new
  end

  def create
    parent_tweet = Tweet.find(params[:tweet_id])
    tweet = current_user.tweets.create(tweet_params)
    puts '=================== REPLIES ======================='
    if parent_tweet.replies << tweet
      redirect_to tweet_path(tweet)
    else
    end
  end

  def destroy
  end

  private

  def tweet_params
    params.required(:tweet).permit(:content)
  end

end