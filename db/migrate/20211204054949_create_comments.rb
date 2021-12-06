class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :customer_id
      t.integer :sell_items
      t.integer :buy_items
      t.text :comment

      t.timestamps
    end
  end
end
