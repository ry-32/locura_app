class RenamePhotoToDlFile < ActiveRecord::Migration[5.0]
  def change
    rename_table :photos, :dl_confirmations
  end
end
