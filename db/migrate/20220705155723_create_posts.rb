class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.integer :author_id, index: true
      t.string :title
      t.string :text
      t.integer :comments_counter
      t.integer :likes_counter

      t.timestamps
    end

    add_foreign_key :comments, :posts, column: :post_id
    add_foreign_key :likes, :posts, column: :post_id
    add_foreign_key :comments, :users, column: :author_id
    add_foreign_key :posts, :users, column: :author_id
    add_foreign_key :likes, :users, column: :author_id
  end
end
