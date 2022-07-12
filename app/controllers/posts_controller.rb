class PostsController < ApplicationController
  def index
    puts Post.all
  end

  def show
    puts Post.first
  end
end
