class AddColumnToPodcaster < ActiveRecord::Migration[5.0]
  def change
    add_column :podcasters, :password, :string
  end
end
