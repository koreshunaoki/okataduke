class RemoveBuyItemsFromFavorites < ActiveRecord::Migration[5.2]
  def change
    remove_column :favorites, :buy_items, :integer
  end
end
