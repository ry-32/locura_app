class AddColumnToDlFile < ActiveRecord::Migration[5.0]
  def change
    add_column :dl_files, :program_id, :integer
  end
end
