class AddRecentPageToPortfolios < ActiveRecord::Migration
  def self.up
    add_column :portfolios, :recent_page, :boolean, :default => true
  end

  def self.down
    remove_column :portfolios, :recent_page
  end
end
