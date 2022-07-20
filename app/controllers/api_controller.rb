module Api
  class UsersController < ApplicationController
    def index
      @user = User.includes(:posts).find(params[:user_id])
      render :json => @user.posts
      puts 'Helloooooo'
    end
  end
end
