class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :text
      t.integer :author_id, index: true
      t.integer :post_id, index: true

      t.timestamps
    end
  end
end
