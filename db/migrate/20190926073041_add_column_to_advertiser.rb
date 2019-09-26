class AddColumnToAdvertiser < ActiveRecord::Migration[5.0]
  def change
    add_column :advertisers, :password, :string
  end
end
