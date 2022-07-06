class Comment < ActiveRecord::Base
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_save :update_comment_counter

  private

  def update_comment_counter
    if post.comments_counter
      author.increment!(:comments_counter)
    else
      author.update(comments_counter: 1)
    end
  end
end
