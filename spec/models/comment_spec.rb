require 'rails_helper'

RSpec.describe Comment, type: :model do
  before(:all) do
    @user = User.create(name: 'Bill', photo: 'none', bio: 'I\'m just a Bill. Yes, I\'m only a Bill.')
    @post = Post.create(author_id: @user.id, title: 'Hello', text: 'I\'m sitting here on Capitol Hill.')
    @comment = Comment.create(author_id: @user.id, post_id: @post.id, text: 'Well, it\'s a long, long journey')
  end

  after(:all) do
    User.destroy_all
    Post.destroy_all
    Comment.destroy_all
  end

  it 'Comment saves correctly' do
    expect(@comment.text).to eq 'Well, it\'s a long, long journey'
  end

  it "Comment updates post's comment counter" do
    @user = User.first
    @post = Post.first
    @comment = Comment.first
    expect(@post.comments_counter).to eq 1
  end
end
