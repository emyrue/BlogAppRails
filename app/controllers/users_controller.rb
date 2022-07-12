class UsersController < ApplicationController
  def index
    @text = "All Users"
  end

  def show
    @text = "Specific User"
  end
end
