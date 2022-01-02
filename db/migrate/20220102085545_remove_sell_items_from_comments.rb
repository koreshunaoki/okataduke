class RemoveSellItemsFromComments < ActiveRecord::Migration[5.2]
  def change
    remove_column :comments, :sell_items, :integer
  end
end
