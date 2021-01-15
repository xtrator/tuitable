class UsersController < ApplicationController
  def profile
    @user = User.find(params[:id])
    @tweets = @user.tweets
  end

  def profile_likes
    @user = User.find(params[:id])
    @tweets = @user.liked_tweets
    render :profile
  end
end
