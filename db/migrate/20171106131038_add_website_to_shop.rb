class AddWebsiteToShop < ActiveRecord::Migration[5.1]
  def change
    add_column :shops, :website, :string
  end
end
