class AddColumnItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :order_status,:integer
  end
end
