class Api::SessionsController < ApiController
	skip_before_action :authorize_user, only: :create

  def create
    user = User.find_by(email: params[:user][:email])
    if user&.valid_password?(params[:user][:password])
      user.regenerate_token
      render json: { token: user.token}
    else
      respond_unauthorized('Incorrect email or password')
    end
  end

  def destroy
    current_user.invalidate_token
    head :no_content
  end
end
