class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users, id: false do |t|
      t.string :email, primary_key: true
      t.string :name
      t.string :role
      t.string :department_id, foreign_key: true

      t.timestamps
    end
  end
end
