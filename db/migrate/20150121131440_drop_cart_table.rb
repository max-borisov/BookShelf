class DropCartTable < ActiveRecord::Migration
  def up
    drop_table :carts
  end

  def down
    raise ActiveRecord::IrreversibleMigration, "Can't recover 'Carts' table"
  end
end
