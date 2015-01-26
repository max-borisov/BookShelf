class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.integer :order_id, index: true
      t.integer :book_id, index: true

      t.timestamps
    end
  end
end
