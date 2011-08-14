class CreateFutureUsers < ActiveRecord::Migration
  def self.up
    create_table :future_users do |t|
      t.string :email
      t.boolean :handled, :default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :future_users
  end
end
