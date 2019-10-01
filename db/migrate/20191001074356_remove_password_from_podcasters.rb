class RemovePasswordFromPodcasters < ActiveRecord::Migration[5.0]
  def change
    remove_column :podcasters, :password, :string
  end
end
