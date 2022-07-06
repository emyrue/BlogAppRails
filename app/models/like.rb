class Like < ActiveRecord::Base
  belongs_to :users, :class_name => 'User', optional: true
  belongs_to :posts, :class_name => 'Post', optional: true

  def update_like_counter
    counter = Like.where(post_id: post_id).count
    Post.update(self.post_id, likes_counter: counter)
  end
end
