class CreateShoes < ActiveRecord::Migration[5.1]
  def change
    create_table :shoes do |t|
      t.string :name
      t.float :durability
      t.float :comfortability
      t.float :ventilation
      t.float :overall
      t.boolean :water_proof
      t.float :money_worthy
      t.date :released_date
      t.references :category, index: true, foreign_key: true
      t.references :brand, index: true, foreign_key: true

      t.timestamps
    end
  end
end
