class CreateInventories < ActiveRecord::Migration[7.0]
  def change
    create_table :inventories do |t|
      t.string :item_sku
      t.date :year_of_purchase
      t.string :location
      t.string :condition_of_item

      t.timestamps
    end
  end
end
