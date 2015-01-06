class AddAmazonIdToBooks < ActiveRecord::Migration
  def change
    add_column :books, :amazon_id, :string
  end
end
