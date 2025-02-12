class CreateUserInventories < ActiveRecord::Migration[7.0]
  def change
    create_table :user_inventories do |t|
      t.string :owner_email, foreign_key: true
      t.string :user_email, foreign_key: true
      t.integer :inventory_id, foreign_key: true

      t.timestamps
    end
  end
end
