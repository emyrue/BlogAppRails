class Comment < ActiveRecord::Base
  belongs_to :users, :class_name => 'User', optional: true
  belongs_to :posts, :class_name => 'Post', optional: true

  def update_comment_counter
  end
end
