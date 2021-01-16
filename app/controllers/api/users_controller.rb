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

  def update
    user = User.find(params[:id])
    authorize user
    if user.update(user_params)
      render json: user
    else
      render json: user.errors, status: :bad_request
    end
  end

  def destroy
    user = User.find(params[:id])
    authorize user
    user.destroy
    head :no_content
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :email, :password)
  end
end