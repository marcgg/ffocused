class RemoveExtraFieldsFromPortfolio < ActiveRecord::Migration
  def self.up
    remove_column :portfolios, :flickr_user_id
    remove_column :portfolios, :flickr_user_name
    remove_column :portfolios, :flickr_user_email
  end

  def self.down
  end
end
