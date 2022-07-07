require 'rails_helper'

RSpec.describe Post, type: :model do
  before(:all) do
    @user = User.create(name: 'Bill', photo: 'none', bio: 'I\'m just a Bill. Yes, I\'m only a Bill.')
    @post = Post.create(author_id: @user.id, title: 'Hello', text: 'I\'m sitting here on Capitol Hill.')
  end

  after(:all) do
    User.destroy_all
    Post.destroy_all
  end

  it "Post updates user's post counter" do
    @user = User.first
    @post = Post.first
    expect(@user.posts_counter).to eq 1
  end
end
