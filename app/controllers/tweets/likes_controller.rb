class Tweets::LikesController < ApplicationController
  def create
    tweet = Tweet.find(params[:tweet_id])
    unless Like.find_by(user: current_user, tweet_id: params[:tweet_id])
      if Like.create(user: current_user, tweet: tweet)
        redirect_to root_path
      else
        #Do Something
      end
    end
  end

  def destroy
    like = Like.find_by(user: current_user, tweet_id: params[:tweet_id])
    if like.destroy
      redirect_to root_path
    else
    end
  end
end