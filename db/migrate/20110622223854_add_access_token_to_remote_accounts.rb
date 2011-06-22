class AddAccessTokenToRemoteAccounts < ActiveRecord::Migration
  def self.up
    add_column :remote_accounts, :access_token, :string
  end

  def self.down
    remove_column :remote_accounts, :access_token
  end
end
