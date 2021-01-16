class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all.where(replied_to: nil).order(created_at: :desc)
    @tweet = Tweet.new
  end

  def show
    @tweet = Tweet.find(params[:id])
    @tweets = @tweet.replies.order(likes_count: :desc)
    @is_show_page = true
  end

  def edit
    @tweet = Tweet.find(params[:id])
    authorize @tweet
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user = current_user
    authorize @tweet
    if @tweet.save
      redirect_back(fallback_location: root_path)
    else
      redirect_to tweets_path, notice: @tweet.errors.full_messages.to_sentence
    end
  end

  def update
    @tweet = Tweet.find(params[:id])
    authorize @tweet
    if @tweet.update(tweet_params)
      redirect_to @tweet
    else
      flash.now.alert = @tweet.errors.full_messages.to_sentence
      render 'edit'
    end
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    authorize @tweet
    @tweet.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def tweet_params
    params.require(:tweet).permit(:body, :user_id, :replied_to_id, :replies)
  end
end
