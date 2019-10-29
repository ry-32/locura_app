class AddColumnToEpisode < ActiveRecord::Migration[5.0]
  def change
    add_column :episodes, :pre_roll_30, :integer
    add_column :episodes, :pre_roll_60, :integer
    add_column :episodes, :mid_roll_30, :integer
    add_column :episodes, :mid_roll_60, :integer
    add_column :episodes, :post_roll_30, :integer
    add_column :episodes, :post_roll_60, :integer
  end
end
