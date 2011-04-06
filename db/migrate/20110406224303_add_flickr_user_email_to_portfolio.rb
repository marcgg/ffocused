class AddFlickrUserEmailToPortfolio < ActiveRecord::Migration
  def self.up
    add_column :portfolios, :flickr_user_email, :string
  end

  def self.down
    remove_column :portfolios, :flickr_user_email
  end
end
