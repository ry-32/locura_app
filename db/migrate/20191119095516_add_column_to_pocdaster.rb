class AddColumnToPocdaster < ActiveRecord::Migration[5.0]
  def change
    add_column :podcasters, :approval, :string
  end
end
