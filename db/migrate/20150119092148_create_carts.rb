class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.references :user, index: true
      t.references :book, index: true

      t.timestamps null: false
    end
    add_foreign_key :carts, :users
    add_foreign_key :carts, :books
  end
end
