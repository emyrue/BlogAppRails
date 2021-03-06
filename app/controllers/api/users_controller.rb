class Api::UsersController < ApplicationController
  skip_before_action :authorize_request, only: :create

  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def create
    user = User.create!(user_params)
    auth_token = AuthenticateUser.new(user.email, user.password).call
    response = { auth_token: auth_token }
    json_response(response)
  end

  private

  def user_params
    params.permit(
      :name,
      :email,
      :bio,
      :password,
      :password_confirmation
    )
  end
end
