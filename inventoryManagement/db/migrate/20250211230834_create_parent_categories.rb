class CreateParentCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :parent_categories, id: false do |t|
      t.string :parent_category, primary_key: true
      t.string :icon
      t.string :color_code

      t.timestamps
    end
  end
end
