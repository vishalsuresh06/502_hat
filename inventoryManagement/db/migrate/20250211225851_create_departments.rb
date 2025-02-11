class CreateDepartments < ActiveRecord::Migration[7.0]
  def change
    create_table :departments, id: false do |t|
      t.string :id, primary_key: true
      t.string :name

      t.timestamps
    end
  end
end
