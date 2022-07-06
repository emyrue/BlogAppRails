class Like < ActiveRecord::Base
  belongs_to :users, :class_name => 'User', optional: true
  belongs_to :posts, :class_name => 'Post', optional: true

  def update_like_counter
  end
end
