class CreateMagazines < ActiveRecord::Migration[5.2]
  def change
    create_table :magazines do |t|
      t.string :title
      t.string :isbn
      t.string :authors
      t.date :published_at

      t.timestamps
    end
  end
end
