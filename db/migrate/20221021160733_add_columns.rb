class AddColumns < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :comments_counter, :int
    add_column :posts, :likes_counter, :int
  end
end
