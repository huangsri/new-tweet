class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    # @tweets = Tweet.find_by(@user.id)
  end
end