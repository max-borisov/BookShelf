class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.date :pub_date
      t.text :description
      t.float :price
      t.string :rating
      t.integer :isbn

      t.timestamps
    end
  end
end
