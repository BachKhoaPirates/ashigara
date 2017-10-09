class CreateShoeImages < ActiveRecord::Migration[5.1]
  def change
    create_table :shoe_images do |t|
      t.references :shoe, foreign_key: true
      t.string :image

      t.timestamps
    end
  end
end
