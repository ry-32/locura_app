class AddColumnToProgram2 < ActiveRecord::Migration[5.0]
  def change
    add_column :programs, :frequency, :string
    add_column :programs, :ave_len, :string
  end
end
