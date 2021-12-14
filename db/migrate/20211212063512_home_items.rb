class HomeItems < ActiveRecord::Migration[5.2]
  def change
    drop_table :home_items
  end
end
