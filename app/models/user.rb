class User < ActiveRecord::Base
  has_many :comments, :class_name => 'Comment'
  has_many :posts, :class_name => 'Post'
  has_many :likes, :class_name => 'Like'

  def most_recent_posts(user_id)
    Post.where(author_id: user_id).order(created_at: :desc).limit(3)
  end
end
