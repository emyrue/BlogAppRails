class Api::CommentsController < ApplicationController
  def index
    @post = Post.find(params[:post_id])
    render :json => @post.comments
  end

  def create
    @user = current_user
    @comment = @user.comment.new(comment_params)
    @comment.post_id = params[:post_id]
    response = {comment: @comment} if @comment.save
    json_response(response)
  end

  private

  def comment_params
    params.permit(:post_id, :text)
  end
end
