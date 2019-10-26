class CreateDlFiles < ActiveRecord::Migration[5.0]
  def change
    create_table :dl_files do |t|
      t.integer :program_id
      t.integer :podcaster_id
      t.string :file

      t.timestamps
    end
  end
end
