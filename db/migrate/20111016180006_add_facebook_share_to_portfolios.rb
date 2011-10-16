class AddFacebookShareToPortfolios < ActiveRecord::Migration
  def self.up
    add_column :portfolios, :facebook_share, :boolean, :default => false
  end

  def self.down
    remove_column :portfolios, :facebook_share
  end
end
