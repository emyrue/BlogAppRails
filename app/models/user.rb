class User < ActiveRecord::Base
  has_many :comments, class_name: 'Comment', dependent: :destroy, foreign_key: 'id'
  has_many :posts, class_name: 'Post', dependent: :destroy, foreign_key: 'id'
  has_many :likes, class_name: 'Like', dependent: :destroy, foreign_key: 'id'

  def most_recent_posts
    Post.where(author_id: id).order(created_at: :desc).limit(3)
  end
end
