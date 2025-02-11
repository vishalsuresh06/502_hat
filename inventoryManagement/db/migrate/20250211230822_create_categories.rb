class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories, id: false do |t|
      t.string :name, primary_key: true
      t.string :parent_category, foreign_key: true
      t.string :icon
      t.string :color_code

      t.timestamps
    end
  end
end
