class AddColumnToDealrequest < ActiveRecord::Migration[5.0]
  def change
    add_column :deal_requests, :status, :string
  end
end
