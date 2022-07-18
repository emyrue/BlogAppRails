require 'rails_helper'

RSpec.describe 'Users', type: :system do
  describe 'index page' do
    before(:example) do
      @user = User.create(name: 'Bill',
                          photo: 'https://insidesources.com/wp-content/uploads/2015/08/130114152903-abc-schoolhouse-rock-just-a-bill-story-top-300x300.jpg',
                          bio: 'I\'m just a Bill.')
      @second_user = User.create(name: 'Interplanet Janet',
                                 photo: 'http://cdn.shopify.com/s/files/1/0253/8910/5237/products/SHR-3_ABC_SchoolHouseRock_NL3900_Turquoise_RO_1200x1200.jpg?v=1592229612',
                                 bio: 'I\'m a galaxy girl')
      @post = Post.create(author_id: @user.id, title: 'Yes, I\'m only a Bill.',
                          text: 'And I\'m sitting here on Capitol Hill.')
      visit users_path
    end

    it 'see username of all other users' do
      expect(page).to have_content(@user.name)
      expect(page).to have_content(@second_user.name)
    end

    it 'see profile picture for each user' do
      image = page.all('img')
      expect(image.size).to eq(2)
    end

    it 'sees number of posts for each user' do
      expect(page).to have_content('Number of Posts: 1')
      expect(page).to have_content('Number of Posts: 0')
    end

    it 'renders user\'s show page when clicked' do
      first(:link, 'Interplanet Janet').click
      expect(page).to have_current_path user_path(@second_user)
      expect(page).to have_content(@second_user.bio)
    end
  end

  describe 'show page' do
    before(:example) do
      @user = User.create(name: 'Bill',
                          photo: 'https://insidesources.com/wp-content/uploads/2015/08/130114152903-abc-schoolhouse-rock-just-a-bill-story-top-300x300.jpg',
                          bio: 'I\'m just a Bill.')
      @post = Post.create(author_id: @user.id, title: 'First post',
                          text: 'Yes, I\'m only a Bill.')
      @second_post = Post.create(author_id: @user.id, title: 'Second post',
                          text: 'And I\'m sitting here on Capitol Hill.')
      @third_post = Post.create(author_id: @user.id, title: 'Third post',
                          text: 'Well, it\'s a long, long journey to Capitol City.')
      visit user_path(@user)
    end

    it 'shows user\'s profile picture' do
      image = page.all('img')
      expect(image.size).to eq(1)
    end

    it 'shows number of posts' do
      expect(page).to have_content('Number of Posts: 3')
    end

    it 'shows user\'s bio' do
      expect(page).to have_content(@user.bio)
    end
  end
end
