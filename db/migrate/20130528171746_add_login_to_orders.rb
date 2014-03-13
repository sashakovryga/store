class AddLoginToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :login, :string
  end
end
