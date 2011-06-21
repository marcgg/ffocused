class AddTypeToRemoteAccounts < ActiveRecord::Migration
  def self.up
    add_column :remote_accounts, :type, :string
  end

  def self.down
    remove_column :remote_accounts, :type
  end
end
