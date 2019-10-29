class RemoveColumnsFromPodcasters < ActiveRecord::Migration[5.0]
  def change
    remove_column :podcasters, :podcast_name
    remove_column :podcasters, :genre
    remove_column :podcasters, :description
    remove_column :podcasters, :url
    remove_column :podcasters, :hosting
    remove_column :podcasters, :memo
  end
end
