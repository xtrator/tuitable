class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all.where(replied_to: nil)
  end

  def show
    @tweet = Tweet.find(params[:id])
    @tweets = @tweet.replies
  end
end
