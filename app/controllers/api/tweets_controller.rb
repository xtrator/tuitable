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
    @tweet = Tweet.
  end
end
