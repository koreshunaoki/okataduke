class AddDetailsToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :item_id, :integer
  end
end
