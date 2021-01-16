class Api::UsersController < ApiController
  skip_before_action :authorize_user, only: [:create, :profile, :liked_tweets]

  def create
    @user = User.new(user_params)
    if @user.save
      @user.regenerate_token
      render json: @user
    else
      render json: @user.errors.messages
    end
  end

  def profile
    user = User.find(params[:id])
    render json: user, include: [:tweets]
  end

  def liked_tweets
    user = User.find(params[:id])
    render json: user, include: [:liked_tweets]
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :email, :password)
  end
end