class AddColumnToPodcaster1 < ActiveRecord::Migration[5.0]
  def change
    add_column :podcasters, :prof_file, :string
  end
end
