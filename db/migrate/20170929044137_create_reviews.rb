class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.string :content
      t.integer :durability
      t.integer :comfortability
      t.integer :ventilation
      t.integer :money_worthy
      t.integer :vote_count
      t.references :shoe, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
