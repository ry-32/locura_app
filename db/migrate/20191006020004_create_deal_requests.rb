class CreateDealRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :deal_requests do |t|
      t.string :name
      t.string :company_name
      t.string :email
      t.string :industry
      t.text :memo
      t.string :campaign_schedule

      t.timestamps
    end
  end
end
