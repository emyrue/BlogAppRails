class UsersController < ApplicationController
  def index
    puts User.all
  end

  def show
    puts User.first
  end
end
