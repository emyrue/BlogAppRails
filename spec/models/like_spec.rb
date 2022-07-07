require 'rails_helper'

RSpec.describe Like, type: :model do 
  before(:all) do
    @user = User.create(name: 'Bill', photo: 'none', bio: 'I\'m just a Bill. Yes, I\'m only a Bill.')
    @post = Post.create(author_id: @user.id, title: 'Hello', text: 'I\'m sitting here on Capitol Hill.')
    @like = Like.create(author_id: @user.id, post_id: @post.id)
  end

  after(:all) do
    User.destroy_all
    Post.destroy_all
    Like.destroy_all
  end

  it "Like updates post's like counter" do
    @user = User.first
    @post = Post.first
    @like = Like.first
    expect(@post.likes_counter).to eq 1
  end
end
