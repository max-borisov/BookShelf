class CreateOrder < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :uid, index: true
      t.decimal :total_price

      t.timestamps
    end
  end
end
