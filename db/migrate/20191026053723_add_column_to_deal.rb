class AddColumnToDeal < ActiveRecord::Migration[5.0]
  def change
    add_column :deals, :status, :string
  end
end
