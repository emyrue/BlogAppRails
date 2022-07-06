class Comment < ActiveRecord::Base
  belongs_to :author, class_name: 'User'
  belongs_to :posts

  after_save :update_comment_counter

  private

  def update_comment_counter
    author.increment!(:comments_counter)
  end
end
