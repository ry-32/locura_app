class AddPasswordDigestToPodcasters < ActiveRecord::Migration[5.0]
  def change
    add_column :podcasters, :password_digest, :string
  end
end
