class Api::CommentsController < ApplicationController
  def index
    @post = Post.includes(:comments).find(params[:post_id])
    render :json => @post.comments
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      puts "saved"
    else
      puts "not saved"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:author_id, :post_id, :text)
  end
end
