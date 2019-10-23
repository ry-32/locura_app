class CreatePrograms < ActiveRecord::Migration[5.0]
  def change
    create_table :programs do |t|
      t.string :name
      t.text :description
      t.string :genre
      t.integer :dl
      t.string :hosting
      t.string :start_date
      t.integer :host_id
      t.string :program_url
      t.string :hp_url

      t.timestamps
    end
  end
end
