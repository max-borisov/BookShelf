class RemoveUidFromOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :uid, :integer
  end
end
