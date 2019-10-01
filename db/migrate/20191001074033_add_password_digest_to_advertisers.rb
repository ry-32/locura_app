class AddPasswordDigestToAdvertisers < ActiveRecord::Migration[5.0]
  def change
    add_column :advertisers, :password_digest, :string
  end
end
