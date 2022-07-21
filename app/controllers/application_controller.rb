class ApplicationController < ActionController::Base
  include Response

  protect_from_forgery with: :exception, unless: :json_request
  before_action :update_allowed_parameters, if: :devise_controller?
  before_action :authorize_request, if: :json_request

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:name, :bio, :photo, :email, :password, :password_confirmation)
    end
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :bio, :photo, :email, :password, :current_password)
    end
  end

  def json_request
    request.format.json?
  end

  private

  def authorize_request
    @current_user = (AuthorizeApiRequest.new(request.headers).call)[:user]
  end
end
