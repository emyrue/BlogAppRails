class PostsController < ApplicationController
  def index
    @text = 'All Posts'
  end

  def show
    @text = 'Specific Post'
  end
end
