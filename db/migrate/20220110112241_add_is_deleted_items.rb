class AddIsDeletedItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :is_deleted, :boolean, default: false, null: false
  end
end
