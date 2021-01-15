class UsersController < ApplicationController
  def profile
    @user = User.find(params[:id])
    @tweets = @user.tweets
    @in_profile = true
  end

  def profile_likes
    @user = User.find(params[:id])
    @tweets = @user.liked_tweets
    render :profile
    @in_profile = false
  end
end
