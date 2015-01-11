class RemoveAmazonIdFromBooks < ActiveRecord::Migration
  def change
    remove_column :books, :publisher, :text
    remove_column :books, :amazon_id, :string
  end
end
