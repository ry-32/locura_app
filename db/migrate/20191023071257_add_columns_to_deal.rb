class AddColumnsToDeal < ActiveRecord::Migration[5.0]
  def change
    add_column :deals, :pre_roll, :integer
    add_column :deals, :mid_roll, :integer
    add_column :deals, :post_roll, :integer
  end
end
