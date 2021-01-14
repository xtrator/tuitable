class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all.where(replied_to: nil)
  end
end
