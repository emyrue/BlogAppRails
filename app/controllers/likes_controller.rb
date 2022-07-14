class LikesController < ApplicationController
  def create
    find_post
    return if already_liked?

    @like = Like.new(author_id: current_user.id, post_id: @post.id)
    @like.save
    redirect_to "/users/#{params[:user_id]}/posts/#{params[:post_id]}"
  end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end

  def already_liked?
    Like.where(author_id: current_user.id, post_id: @post.id).exists?
  end
end
