class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all.where(replied_to: nil).order(created_at: :desc)
    @tweet = Tweet.new
  end

  def show
    @tweet = Tweet.find(params[:id])
    @tweets = @tweet.replies.order(likes_count: :desc)
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user = current_user
    if @tweet.save
      redirect_to tweets_path
    else
      redirect_to tweets_path, notice: @tweet.errors.full_messages.to_sentence
    end
  end

  def update
    @tweet = Tweet.find(params[:id])
    if @tweet.update(tweet_params)
      redirect_to tweet_path(@tweet)
    else
      flash.now.alert = @tweet.errors.full_messages.to_sentence
      render 'edit'
    end
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    if @tweet.replied_to
      replied_to = @tweet.replied_to
      @tweet.destroy
      redirect_to replied_to
    else
      @tweet.destroy
      redirect_to tweets_path
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit(:body, :user_id, :replied_to_id, :replies)
  end
end
