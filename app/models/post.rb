class Post < ActiveRecord::Base
  has_many :comments, class_name: 'Comment', dependent: :destroy
  has_many :likes, class_name: 'Like', dependent: :destroy
  belongs_to :author, class_name: 'User', optional: true

  after_save :update_post_counter

  def most_recent_comments
    Comment.where(post_id: id).order(created_at: :desc).limit(5)
  end

  private

  def update_post_counter
    unless author.posts_counter
      author.update(posts_counter: 1)
    else
      author.increment!(:posts_counter)
    end
  end
end
