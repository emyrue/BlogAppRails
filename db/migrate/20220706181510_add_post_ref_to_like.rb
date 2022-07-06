class AddPostRefToLike < ActiveRecord::Migration[7.0]
  def change
    add_reference :likes, :posts, null: false, foreign_key: true, index: true
  end
end
