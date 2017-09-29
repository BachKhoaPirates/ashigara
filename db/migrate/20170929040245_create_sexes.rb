class CreateSexes < ActiveRecord::Migration[5.1]
  def change
    create_table :sexes do |t|
      t.string :name

      t.timestamps
    end
  end
end
