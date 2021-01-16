class LikesController < ApplicationController
  def create
    # params nos esta pasando el :id, que el tweet.id
    tweet = Tweet.find(params[:id])
    # poner un policy aqui :D
    user = current_user
    Tweet.create(user: user, tweet: tweet)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    tweet = Tweet.find(params[:id])
    # poner un policy aqui :D
    user = current_user
    Tweet.destroy(user: user, tweet: tweet)
    redirect_back(fallback_location: root_path)
  end
end
