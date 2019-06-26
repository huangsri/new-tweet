class FollowsController < ApplicationController
  def following
    @user = User.find params[:id]
    @followings = @user.following
  end

  def followers
    @user = User.find params[:id]
    @followers = @user.followers
  end

  def follow_user
    if current_user.follow(params[:user_id])
      redirect_back(fallback_location: root_path)
    end
  end

  def unfollow_user
    if current_user.unfollow(params[:user_id])
      redirect_back(fallback_location: root_path)
    end
  end
end