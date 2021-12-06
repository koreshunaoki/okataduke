class CreateHomeItems < ActiveRecord::Migration[5.2]
  def change
    create_table :home_items do |t|
      t.integer :category_id
      t.integer :customer_id
      t.string :name
      t.string :image_id
      t.string :place_to_put
      t.string :memo_text

      t.timestamps
    end
  end
end
