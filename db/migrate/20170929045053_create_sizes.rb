class CreateSizes < ActiveRecord::Migration[5.1]
  def change
    create_table :sizes do |t|
      t.string :size
      t.float :foot_length
      t.float :foot_width
      t.references :shoe, foreign_key: true

      t.timestamps
    end
  end
end
