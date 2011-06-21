class CreateRemoteAccounts < ActiveRecord::Migration
  def self.up
    create_table :remote_accounts do |t|
      t.string :remote_user_name
      t.integer :portfolio_id
      t.string :remote_user_id
      t.string :remote_user_email

      t.timestamps
    end
  end

  def self.down
    drop_table :remote_accounts
  end
end
