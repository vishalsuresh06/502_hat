class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items, id: false do |t|
      t.string :sku, primary_key: true
      t.string :name
      t.string :description
      t.string :category_name, foreign_key: true

      t.timestamps
    end
  end
end
