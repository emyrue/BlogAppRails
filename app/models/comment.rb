class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_save :update_comment_counter
  after_destroy :delete_comment

  validates :text, presence: true, allow_blank: false

  private

  def update_comment_counter
    post.increment!(:comments_counter)
  end

  def delete_comment
    post.decrement!(:comments_counter)
  end
end
