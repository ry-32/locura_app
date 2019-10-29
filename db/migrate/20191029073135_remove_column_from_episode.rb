class RemoveColumnFromEpisode < ActiveRecord::Migration[5.0]
  def change
    remove_column :episodes, :pre_roll
    remove_column :episodes, :mid_roll
    remove_column :episodes, :post_roll
  end
end
