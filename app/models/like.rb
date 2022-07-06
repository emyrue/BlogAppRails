class Like < ActiveRecord::Base
  belongs_to :author, class_name: 'User'
  belongs_to :posts

  after_save :update_like_counter

  private

  def update_like_counter
    unless author.likes_counter
      author.update(likes_counter: 1)
    else
      author.increment!(:likes_counter)
    end
  end
end
