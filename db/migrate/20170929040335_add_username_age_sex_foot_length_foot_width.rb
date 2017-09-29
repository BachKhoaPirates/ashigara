class AddUsernameAgeSexFootLengthFootWidth < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :username, :string
    add_column :users, :dob, :date
    add_reference :users, :sexes, foreign_key: true
    add_column :users, :foot_length, :float
    add_column :users, :foot_width, :float
  end
end
