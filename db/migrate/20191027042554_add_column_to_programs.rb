class AddColumnToPrograms < ActiveRecord::Migration[5.0]
  def change
    add_column :programs, :prof_file, :string
  end
end
