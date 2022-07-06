class Post < ActiveRecord::Base
  has_many :comments, :class_name => 'Comment'
  has_many :likes, :class_name => 'Like'
  belongs_to :users, :class_name => 'User', optional: true

  def update_post_counter
  end

  def most_recent_comments
  end
end
