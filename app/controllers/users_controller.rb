class UsersController < ApplicationController
  def profile
    @user = User.find(params[:id])
    @tweets = @user.tweets
    @in_profile = true
  end

  def profile_liked_tweets
    @user = User.find(params[:id])
    @tweets = @user.liked_tweets
    @in_profile = false
    render :profile
  end
end
