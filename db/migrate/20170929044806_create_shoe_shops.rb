class CreateShoeShops < ActiveRecord::Migration[5.1]
  def change
    create_table :shoe_shops do |t|
      t.references :shoe, foreign_key: true
      t.references :shop, foreign_key: true

      t.timestamps
    end
  end
end
