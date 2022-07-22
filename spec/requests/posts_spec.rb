require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before(:example) do
      @user = User.new(name: 'Bill', photo: 'none', bio: 'I\'m just a Bill. Yes, I\'m only a Bill.', email: 'justabill@gmail.com', password: 'committee')
      @user.skip_confirmation!
      @user.save!
      get "#{users_path}/#{@user.id}/posts"
    end

    after do
      User.destroy_all
    end

    it 'Successfully gets index' do
      expect(response).to have_http_status(:ok)
    end

    it 'Renders index template' do
      expect(response).to render_template('index')
    end
  end

  describe 'GET /show' do
    before(:example) do
      @user = User.new(name: 'Bill', photo: 'none', bio: 'I\'m just a Bill. Yes, I\'m only a Bill.', email: 'justabill@gmail.com', password: 'committee')
      @user.skip_confirmation!
      @user.save!
      @post = Post.create(author_id: @user.id, title: 'Hello', text: 'I\'m sitting here on Capitol Hill.')
      get "#{users_path}/#{@user.id}/posts/#{@post.id}"
    end

    after do
      User.destroy_all
      Post.destroy_all
    end

    it 'Successfully gets show' do
      expect(response).to have_http_status(:ok)
    end

    it 'Renders show template' do
      expect(response).to render_template('show')
    end
  end
end
