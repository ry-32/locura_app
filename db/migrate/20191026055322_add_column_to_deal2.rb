class AddColumnToDeal2 < ActiveRecord::Migration[5.0]
  def change
    add_column :deals, :episode_id, :integer
  end
end
