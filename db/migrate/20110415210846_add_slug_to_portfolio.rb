class AddSlugToPortfolio < ActiveRecord::Migration
  def self.up
    add_column :portfolios, :slug, :string
  end

  def self.down
    remove_column :portfolios, :slug
  end
end
