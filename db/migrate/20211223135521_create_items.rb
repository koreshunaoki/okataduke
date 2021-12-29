class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :category_id
      t.integer :customer_id
      t.string :name
      t.string :image_id
      t.string :introduction
      t.integer :price
      t.string :place_to_put

      t.timestamps
    end
  end
end
