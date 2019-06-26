class TweetsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    # @tweets = Tweet.order('created_at DESC')
    @trends = ActsAsTaggableOn::Tag.most_used(10)
    @tweets = if current_user 
      current_user.get_tweets_by_following & Tweet.publish
    else
      Tweet.all.order('created_at DESC')
    end
  end

  def create
    tweet = current_user.tweets.create(tweet_params)
    if tweet.save
      redirect_to root_path
    else
    end
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy if tweet.user.id == current_user.id
    redirect_to root_path
  end

  private

  def tweet_params
    params.required(:tweet).permit(:content, :publish_at)
  end
end
