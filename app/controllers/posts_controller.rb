class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @all_posts = Post.where(author_id: params[:user_id]).order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(@post.author_id)
    @comments = Comment.where(post_id: params[:id]).order(created_at: :desc)
  end

  def new
    @post = Post.new(author_id: current_user.id)
    respond_to do |format|
      format.html { render :new, locals: { post: @post } }
    end
  end
end
