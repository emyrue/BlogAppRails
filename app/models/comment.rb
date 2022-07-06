class Comment < ActiveRecord::Base
  belongs_to :users, :class_name => 'User', optional: true
  belongs_to :posts, :class_name => 'Post', optional: true

  def update_comment_counter
    counter = Comment.where(post_id: post_id).count
    Post.update(self.post_id, comments_counter: counter)
  end
end
