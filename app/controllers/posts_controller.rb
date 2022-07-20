class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.includes(:posts).find(params[:user_id])
  end

  def show
    @post = Post.includes(:author).find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(author_id: current_user.id, title: params.require(:post).permit(:title)['title'],
                     text: params.require(:post).permit(:text)['text'])
    if @post.save
      flash[:notice] = 'Post saved successfully'
      redirect_to "/users/#{current_user.id}"
    else
      flash[:error] = 'Post not saved'
      redirect_to '/posts/new'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    @post.author.update
    redirect_to root_path
  end
end
