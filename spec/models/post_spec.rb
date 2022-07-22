require 'rails_helper'

RSpec.describe Post, type: :model do
  before(:all) do
    @user = User.new(name: 'Bill', photo: 'none', bio: 'I\'m just a Bill. Yes, I\'m only a Bill.', email: 'justabill@gmail.com', password: 'committee')
    @user.skip_confirmation!
    @user.save!
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

  it 'Title should be present' do
    @post.title = nil
    expect(@post).to_not be_valid
  end

  it "Title can't be blank" do
    @post.title = ''
    expect(@post).to_not be_valid
  end

  it 'Title should be less than or equal to 250 characters' do
    @post.title = 'a' * 300
    expect(@post).to_not be_valid
  end

  it 'Comments counter should be an integer' do
    @post.comments_counter = 1.5
    expect(@post).to_not be_valid
  end

  it 'Comments counter should be greater than or equal to 0' do
    @post.comments_counter = -1
    expect(@post).to_not be_valid
  end

  it 'Likes counter should be an integer' do
    @post.likes_counter = 1.5
    expect(@post).to_not be_valid
  end

  it 'Likes counter should be greater than or equal to 0' do
    @post.likes_counter = -1
    expect(@post).to_not be_valid
  end
end
