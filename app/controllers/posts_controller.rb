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
    @post = Post.new
  end

  def create
    @post = Post.new(author_id: current_user.id, title: params.require(:post).permit(:title)["title"], text: params.require(:post).permit(:text)["text"])
    if @post.save
      flash[:notice] = "Post saved successfully"
      redirect_to "/users/#{current_user.id}"
    else
      flash[:error] = "Post not saved"
      render :new
    end
  end
end
