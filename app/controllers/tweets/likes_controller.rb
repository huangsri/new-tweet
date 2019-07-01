class Tweets::LikesController < ApplicationController
  def create
    @tweet = Tweet.find(params[:tweet_id])

    return if  Like.find_by(user: current_user, tweet_id: params[:tweet_id])

    if Like.create(user: current_user, tweet: @tweet)
      respond_to do |format|
        format.js
      end
    else
      #Do Something
    end

  end

  def destroy
    
    like = Like.find_by(user: current_user, tweet_id: params[:tweet_id])
    
    if like.destroy
      @tweet = Tweet.find(params[:tweet_id])
      respond_to do |format|
        format.js
      end
    else
    end
  end
end