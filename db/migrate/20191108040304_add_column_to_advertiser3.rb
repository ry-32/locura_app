class AddColumnToAdvertiser3 < ActiveRecord::Migration[5.0]
  def change
    add_column :advertisers, :biz_description, :text
    add_column :advertisers, :hp_url, :string
  end
end
