class Api::TweetsController < ApiController
  skip_before_action :authorize_user, only: [:index, :show]

  def index
    @tweets = Tweet.all.where(replied_to: nil).order(created_at: :desc)
    render json: @tweets
  end

  def show
    @tweet = Tweet.find(params[:id])
    @tweets = @tweet.replies.order(likes_count: :desc)
    render json: @tweet, include: [:replies]
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user = current_user
    if @tweet.save
      render json: @tweet
    else
      render json: @tweet.errors.messages
    end
  end

  def update
    tweet = Tweet.find(params[:id])
    authorize tweet
    if tweet.update(tweet_params)
      render json: tweet
    else
      render json: tweet.errors , status: 400
    end
  end

  def destroy
    tweet = Tweet.find(params[:id])
    authorize tweet
    tweet.destroy
    head :no_content
  end

  private 

  def tweet_params
    params.require(:tweet).permit(:body)
  end
end
