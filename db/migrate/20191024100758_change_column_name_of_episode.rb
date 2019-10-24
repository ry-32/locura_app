class ChangeColumnNameOfEpisode < ActiveRecord::Migration[5.0]
  def change
    rename_column :episodes, :podcaster_id, :program_id
  end
end
