class CreateDlFiles < ActiveRecord::Migration[5.0]
  def change
    create_table :dl_files do |t|
      t.binary :upload_file
      t.string :upload_filename

      t.timestamps
    end
  end
end
