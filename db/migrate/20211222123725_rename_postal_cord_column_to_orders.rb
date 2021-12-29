class RenamePostalCordColumnToOrders < ActiveRecord::Migration[5.2]
  def change
    rename_column :orders, :postal_cord, :postal_code
  end
end
