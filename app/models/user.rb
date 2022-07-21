class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :comments, dependent: :destroy, foreign_key: 'author_id'
  has_many :posts, dependent: :destroy, foreign_key: 'author_id'
  has_many :likes, dependent: :destroy, foreign_key: 'author_id'

  validates :name, presence: true, allow_blank: false
  validates :posts_counter, comparison: { greater_than_or_equal_to: 0 }, numericality: { only_integer: true }

  def most_recent_posts
    posts.order('created_at Desc').limit(3)
  end

  def admin?
    role == 'admin'
  end

  def as_json(_options = {})
    super(only: %i[id name bio posts_counter])
  end
end
