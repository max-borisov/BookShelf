class CreateCartItems < ActiveRecord::Migration
  def change
    create_table :cart_items do |t|
      t.references :user, index: true
      t.references :book, index: true

      t.timestamps null: false
    end
    add_foreign_key :cart_items, :users
    add_foreign_key :cart_items, :books
  end
end
