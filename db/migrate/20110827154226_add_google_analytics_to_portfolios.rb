class AddGoogleAnalyticsToPortfolios < ActiveRecord::Migration
  def self.up
    add_column :portfolios, :google_analytics_code, :string
  end

  def self.down
    remove_column :portfolios, :google_analytics_code
  end
end
