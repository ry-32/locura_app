class AddColumnsToProgram < ActiveRecord::Migration[5.0]
  def change
    add_column :programs, :cpm_30_pre, :integer
    add_column :programs, :cpm_60_pre, :integer
    add_column :programs, :cpm_30_mid, :integer
    add_column :programs, :cpm_60_mid, :integer
    add_column :programs, :cpm_30_post, :integer
    add_column :programs, :cpm_60_post, :integer
  end
end
