class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.binary :photo
      t.string :bio
      t.integer :posts_counter

      t.timestamps
    end

    add_foreign_key :comments, :users, column: :author_id
    add_foreign_key :posts, :users, column: :author_id
    add_foreign_key :likes, :users, column: :author_id
  end
end
