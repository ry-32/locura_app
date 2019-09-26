class CreateAdvertisers < ActiveRecord::Migration[5.0]
  def change
    create_table :advertisers do |t|
      t.string :name
      t.string :email
      t.string :company_name
      t.string :industry

      t.timestamps
    end
  end
end
