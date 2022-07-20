class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(author_id: current_user.id, post_id: params[:post_id],
                           text: params.require(:comment).permit('text')['text'])
    if @comment.save
      flash[:notice] = 'Comment saved successfully'
      redirect_to "/users/#{params[:user_id]}/posts/#{params[:post_id]}"
    else
      flash[:error] = 'Comment not saved'
      redirect_to "/users/#{params[:user_id]}/posts/#{params[:post_id]}/comments/new"
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to root_path
  end
end
