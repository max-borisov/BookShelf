class AddPublisherToBook < ActiveRecord::Migration
  def change
    add_column :books, :publisher, :text
  end
end
