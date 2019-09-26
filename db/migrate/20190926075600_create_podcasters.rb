class CreatePodcasters < ActiveRecord::Migration[5.0]
  def change
    create_table :podcasters do |t|
      t.string :name
      t.string :podcast_name
      t.string :email
      t.string :genre
      t.text :description
      t.string :url
      t.string :hosting
      t.text :memo

      t.timestamps
    end
  end
end
