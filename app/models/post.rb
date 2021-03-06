class Post < ApplicationRecord
  has_many :comments, dependent: :destroy, foreign_key: 'post_id'
  has_many :likes, dependent: :destroy, foreign_key: 'post_id'
  belongs_to :author, class_name: 'User'

  validates :title, presence: true, allow_blank: false, length: { maximum: 250 }
  validates :comments_counter, presence: true, comparison: { greater_than_or_equal_to: 0 },
                               numericality: { only_integer: true }
  validates :likes_counter, presence: true, comparison: { greater_than_or_equal_to: 0 },
                            numericality: { only_integer: true }

  after_save :update_post_counter
  after_destroy :destroy_post

  def most_recent_comments
    Comment.where(post_id: id).order(created_at: :desc).limit(5)
  end

  private

  def update_post_counter
    author.increment!(:posts_counter)
  end

  def destroy_post
    author.decrement!(:posts_counter)
  end
end
