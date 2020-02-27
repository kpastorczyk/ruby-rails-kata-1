class CreateAuthors < ActiveRecord::Migration[5.2]
  def change
    create_table :authors do |t|
      t.string :email, null: false
      t.string :firstname, null: false
      t.string :lastname, null: false

      t.timestamps
    end
  end
end
