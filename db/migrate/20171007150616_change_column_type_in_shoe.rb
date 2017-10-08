class ChangeColumnTypeInShoe < ActiveRecord::Migration[5.1]
  def change
    remove_column :sizes, :size, :string
    add_column :sizes, :size, :integer
  end
end
