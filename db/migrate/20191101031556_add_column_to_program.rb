class AddColumnToProgram < ActiveRecord::Migration[5.0]
  def change
    add_column :programs, :dlfile, :string 
  end
end
