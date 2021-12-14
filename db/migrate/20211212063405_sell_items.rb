class SellItems < ActiveRecord::Migration[5.2]
  def change
    drop_table :sell_items
    
  end
end
