class Post < ApplicationRecord
  has_many :comments, :likes
  belongs_to :users
end
