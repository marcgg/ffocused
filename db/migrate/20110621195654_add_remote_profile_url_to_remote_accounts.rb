class AddRemoteProfileUrlToRemoteAccounts < ActiveRecord::Migration
  def self.up
    add_column :remote_accounts, :remote_profile_url, :string
  end

  def self.down
    remove_column :remote_accounts, :remote_profile_url
  end
end
