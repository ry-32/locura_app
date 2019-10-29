class AddColumnToDeal3 < ActiveRecord::Migration[5.0]
  def change
    add_column :deals, :pre_roll_30, :integer
    add_column :deals, :pre_roll_60, :integer
    add_column :deals, :mid_roll_30, :integer
    add_column :deals, :mid_roll_60, :integer
    add_column :deals, :post_roll_30, :integer
    add_column :deals, :post_roll_60, :integer
  end
end
