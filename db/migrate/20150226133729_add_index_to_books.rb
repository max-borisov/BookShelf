class AddIndexToBooks < ActiveRecord::Migration
  def change
    add_index :books, :isbn, unique: true
    add_index :books, :amazon_id, unique: true
  end
end
