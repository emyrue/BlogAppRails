require 'rails_helper'

RSpec.describe User, type: :model do
  before(:all) do
    @user = User.create(name: 'Bill', photo: 'none', bio: 'I\'m just a Bill. Yes, I\'m only a Bill.')
  end

  after(:all) do
    User.destroy_all
  end

  it "Name must be present" do
    @user.name = nil
    expect(@user).to_not be_valid
  end

  it "Name can't be blank" do
    @user.name = ""
    expect(@user).to_not be_valid
  end

  it "Posts counter should be an integer" do
    @user.posts_counter = 1.5
    expect(@user).to_not be_valid
  end

  it "Posts counter should be greater than or equal to 0" do
    @user.posts_counter = -1
    expect(@user).to_not be_valid
  end

end
