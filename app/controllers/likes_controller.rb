class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    tweet = Tweet.find(params[:id])
    user = current_user
    Like.create(user: user, tweet: tweet)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    tweet = Tweet.find(params[:id])
    user = current_user
    Like.destroy_by(user: user, tweet: tweet)
    redirect_back(fallback_location: root_path)
  end
end
