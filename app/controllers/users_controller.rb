class UsersController < ApplicationController
  def profile
    @user = User.find(params[:id])
    @tweets = @user.tweets
  end
end
