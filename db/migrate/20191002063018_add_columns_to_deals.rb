class AddColumnsToDeals < ActiveRecord::Migration[5.0]
  def change
    add_column :deals, :name, :string
  end
end
