class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include Pundit

  before_action :update_allowed_parameters, if: :devise_controller?

  rescue_from Pundit::NotAuthorizedError do |e|
    if current_user
      redirect_to root_path, alert: e.message
    else
      redirect_to new_user_session_path, alert: 'You need to login first'
    end
  end

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:name, :username, :email, :avatar, :password)
    end
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :username, :email, :avatar, :password, :current_password)
    end
  end
end
