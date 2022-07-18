require 'rails_helper'

RSpec.describe 'Posts', type: :system do
  describe 'index page' do
    before do
      driven_by(:selenium_chrome_headless)
    end

    before(:example) do
      @user = User.create(name: 'Bill',
                          photo: 'https://insidesources.com/wp-content/uploads/2015/08/130114152903-abc-schoolhouse-rock-just-a-bill-story-top-300x300.jpg',
                          bio: 'I\'m just a Bill.')
      @second_user = User.create(name: 'Interplanet Janet',
                                 photo: 'http://cdn.shopify.com/s/files/1/0253/8910/5237/products/SHR-3_ABC_SchoolHouseRock_NL3900_Turquoise_RO_1200x1200.jpg?v=1592229612',
                                 bio: 'I\'m a galaxy girl')
      @post = Post.create(author_id: @user.id, title: 'First post',
                          text: 'Yes, I\'m only a Bill.')
      @first_comment = Comment.create(author_id: @second_user.id, post_id: @post.id, text: 'She\'s a galaxy girl.')
      @second_comment = Comment.create(author_id: @second_user.id, post_id: @post.id, text: 'A solar system miss from a future world.')
      @third_comment = Comment.create(author_id: @second_user.id, post_id: @post.id, text: 'She travels like a rocket through her comet team.')
      @fourth_comment = Comment.create(author_id: @second_user.id, post_id: @post.id, text: 'There\'s never been a planet Janet hasn\'t seen.')
      @fifth_comment = Comment.create(author_id: @second_user.id, post_id: @post.id, text: 'No, there\'s never been a planet Janet hasn\'t seen.')
      visit user_posts_path(@user)
    end

    it 'shows user\'s profile picture' do
      image = page.all('img')
      expect(image.size).to eq(1)
    end

    it 'shows user\'s username' do
      expect(page).to have_content(@user.name)
    end

    it 'shows number of posts by that user' do
      expect(page).to have_content('Number of Posts: 1')
    end

    it 'shows title of post' do
      expect(page).to have_content(@post.title)
    end

    it 'shows post\'s body' do
      expect(page).to have_content(@post.text)
    end

    it 'shows the first comments on a post' do
      expect(page).to have_content(@first_comment.text)
    end

    it 'shows number of comments the post has' do
      expect(page).to have_content('Comments: 5')
    end

    it 'shows how many likes the post has' do
      expect(page).to have_content('Likes: 0')
    end

    it 'has pagination button' do
      expect(page).to have_content('Pagination')
    end

    it 'redirects to the post show page when clicking on the title' do
      click_link(@post.title)
      expect(page).to have_current_path user_post_path(@user, @post)
      expect(page).to have_content(@post.title)
    end
  end
end