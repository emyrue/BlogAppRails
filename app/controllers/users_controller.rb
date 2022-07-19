class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @all_users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.most_recent_posts
  end
end
