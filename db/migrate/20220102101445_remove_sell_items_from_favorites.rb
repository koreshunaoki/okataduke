class RemoveSellItemsFromFavorites < ActiveRecord::Migration[5.2]
  def change
    remove_column :favorites, :sell_items, :integer
  end
end
