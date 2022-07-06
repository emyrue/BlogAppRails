class Post < ActiveRecord::Base
  has_many :comments, class_name: 'Comment'
  has_many :likes, class_name: 'Like'
  belongs_to :users, class_name: 'User', optional: true

  def update_post_counter
    counter = Post.where(author_id: author_id).count
    User.update(author_id, posts_counter: counter)
  end

  def most_recent_comments
    Comment.where(post_id: id).order(created_at: :desc).limit(5)
  end
end
