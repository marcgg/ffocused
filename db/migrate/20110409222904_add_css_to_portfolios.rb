class AddCssToPortfolios < ActiveRecord::Migration
  def self.up
    add_column :portfolios, :css, :text
  end

  def self.down
    remove_column :portfolios, :css
  end
end
