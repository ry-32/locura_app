class RemovePasswordFromAdvertisers < ActiveRecord::Migration[5.0]
  def change
    remove_column :advertisers, :password, :string
  end
end
