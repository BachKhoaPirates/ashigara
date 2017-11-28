class AddVotesCountToReviews < ActiveRecord::Migration[5.1]
  def change
    add_column :reviews, :votes_count, :integer, :default => 0, :null => false
  end
end
