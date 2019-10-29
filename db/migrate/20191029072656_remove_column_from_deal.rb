class RemoveColumnFromDeal < ActiveRecord::Migration[5.0]
  def change
    remove_column :deals, :pre_roll
    remove_column :deals, :mid_roll
    remove_column :deals, :post_roll
  end
end
