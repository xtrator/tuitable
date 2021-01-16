class Api::UsersController < ApiController
  skip_before_action :authorize, only: :create

  def create
    @user = User.new(user_params)
    if @user.save
      @user.regenerate_token
      render json: @user
    else
      render json: @user.errors.messages
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :email, :password)
  end
end