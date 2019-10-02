class CreateDeals < ActiveRecord::Migration[5.0]
  def change
    create_table :deals do |t|
      t.integer :advertiser_id
      t.integer :podcaster_id
      t.text :description
      t.integer :forecasted_dl
      t.integer :dl
      t.integer :cost

      t.timestamps
    end
  end
end
