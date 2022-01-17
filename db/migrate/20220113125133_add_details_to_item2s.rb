class AddDetailsToItem2s < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :item_home_id, :integer
  end
end
