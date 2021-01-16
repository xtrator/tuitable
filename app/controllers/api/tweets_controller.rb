class Api::TweetsController < ApiController
  skip_before_action :authorize, only: [:index, :show]

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
    @tweet = Tweet.new(params)
    @tweet.user = current_user
    if @tweet.save
      render json: @tweet
    else
      render json: @tweet.errors.messages
    end
  end

  private 

  def tweet_params
    params.require(:tweet).permit(:body)
  end
end
