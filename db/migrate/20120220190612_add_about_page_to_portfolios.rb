class AddAboutPageToPortfolios < ActiveRecord::Migration
  def self.up
    add_column :portfolios, :about_page, :boolean, :default => false
  end

  def self.down
    remove_column :portfolios, :about_page
  end
end
