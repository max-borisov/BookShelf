class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :text, null: false
      t.references :user, index: true, null: false
      t.references :book, index: true, null: false

      t.timestamps null: false
    end
    add_foreign_key :reviews, :users
    add_foreign_key :reviews, :books
  end
end
