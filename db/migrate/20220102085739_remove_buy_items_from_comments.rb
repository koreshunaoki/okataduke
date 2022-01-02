class RemoveBuyItemsFromComments < ActiveRecord::Migration[5.2]
  def change
    remove_column :comments, :buy_items, :integer
  end
end
