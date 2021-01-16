class ApiController < ActionController::API
  # This is neened because ActionControlle::API doesn't include the module by default
  # This module is required for using authenticate_with_http_token method
  include ActionController::HttpAuthentication::Token::ControllerMethods
  include Pundit

  before_action :authorize

  def current_user
    @current_user ||= authenticate_token
  end

  def authorize
    authenticate_token || respond_unauthorized('Access denied')
  end

  private

  def respond_unauthorized(message)
    error = { unauthorized: message }
    render json: error, status: :unauthorized
  end

  def authenticate_token
    authenticate_with_http_token do |token, _options|
      User.find_by(token: token)
    end
  end
  
  rescue_from ActiveRecord::RecordNotFound do |e|
    render json: { message: e.message }, status: :not_found
  end

  rescue_from Pundit::NotAuthorizedError do |e|
    respond_unauthorized(e.message)
  end
end
