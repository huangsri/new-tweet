class TrendsController < ApplicationController
  def show
    @tweets = Tweet.tagged_with(params[:tag])
  end
end