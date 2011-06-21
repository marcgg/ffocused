class AddRemoteAccountIdToCategories < ActiveRecord::Migration
  def self.up
    add_column :categories, :remote_account_id, :integer
  end

  def self.down
    remove_column :categories, :remote_account_id
  end
end
