class Api::LikesController < ApiController
  def create
    tweet = Tweet.find(params[:id])
    user = current_user
    like = Like.create(user: user, tweet: tweet)
    if like.errors.any?
      render json: like.errors, status: :bad_request
    else
      render json: like
    end
  end

  def destroy
    tweet = Tweet.find(params[:id])
    user = current_user
    like = Like.find_by!(user: user, tweet: tweet)
    like.destroy
    head :no_content
  end
end