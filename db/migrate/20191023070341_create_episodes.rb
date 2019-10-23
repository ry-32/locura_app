class CreateEpisodes < ActiveRecord::Migration[5.0]
  def change
    create_table :episodes do |t|
      t.integer :podcaster_id
      t.string :name
      t.string :date
      t.integer :pre_roll
      t.integer :mid_roll
      t.integer :post_roll

      t.timestamps
    end
  end
end
