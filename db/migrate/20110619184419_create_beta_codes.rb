class CreateBetaCodes < ActiveRecord::Migration
  def self.up
    create_table :beta_codes do |t|
      t.string :code
      t.boolean :used, :default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :beta_codes
  end
end
