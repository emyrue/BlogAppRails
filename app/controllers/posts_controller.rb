class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @all_posts = Post.where(author_id: params[:user_id]).order(created_at: :desc)
    @limit = 3
  end

  def show
    @text = 'Specific Post'
  end
end
