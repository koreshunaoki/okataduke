class ItemSells < ActiveRecord::Migration[5.2]
  def change
    drop_table :item_sells
  end
end
