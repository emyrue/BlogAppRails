class User < ActiveRecord::Base
  has_many :comments, :class_name => 'Comment'
  has_many :posts, :class_name => 'Post'
  has_many :likes, :class_name => 'Like'

  def most_recent_posts
    Post.where(author_id: id).order(created_at: :desc).limit(3)
  end
end
