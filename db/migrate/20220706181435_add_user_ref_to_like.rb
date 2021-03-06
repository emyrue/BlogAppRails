class AddUserRefToLike < ActiveRecord::Migration[7.0]
  def change
    add_reference :likes, :author, foreign_key: { to_table: :users }, null: false, index: true, on_delete: :cascade
  end
end
