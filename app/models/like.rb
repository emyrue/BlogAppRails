class Like < ActiveRecord::Base
  belongs_to :author, class_name: 'User'
  belongs_to :posts

  after_save :update_like_counter

  private

  def update_like_counter
    if author.likes_counter
      author.increment!(:likes_counter)
    else
      author.update(likes_counter: 1)
    end
  end
end
