class User < ActiveRecord::Base
  has_many :comments, dependent: :destroy, foreign_key: 'author_id'
  has_many :posts, dependent: :destroy, foreign_key: 'author_id'
  has_many :likes, dependent: :destroy, foreign_key: 'author_id'

  validates :name, presence: true, allow_blank: false
  validates :posts_counter, comparison: { greater_than_or_equal_to: 0 }, numericality: { only_integer: true }

  def most_recent_posts
    posts.order('created_at Desc').limit(3)
  end
end
