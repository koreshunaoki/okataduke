class ItemBuys < ActiveRecord::Migration[5.2]
  def change
    drop_table :item_buys
  end
end
