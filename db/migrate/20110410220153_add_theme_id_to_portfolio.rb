class AddThemeIdToPortfolio < ActiveRecord::Migration
  def self.up
    add_column :portfolios, :theme_id, :integer
  end

  def self.down
    remove_column :portfolios, :theme_id
  end
end
