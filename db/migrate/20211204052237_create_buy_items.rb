class CreateBuyItems < ActiveRecord::Migration[5.2]
  def change
    create_table :buy_items do |t|
      t.integer :category_id
      t.integer :customer_id
      t.string :name
      t.string :image_id
      t.text :introduction
      t.integer :price

      t.timestamps
    end
  end
end
