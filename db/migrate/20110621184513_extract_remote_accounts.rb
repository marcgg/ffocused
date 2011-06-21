class ExtractRemoteAccounts < ActiveRecord::Migration
  def self.up
    Portfolio.all.each do |portfolio|
      next if portfolio.flickr_user_id.blank?
      RemoteAccount::Flickr.create!({
        :remote_user_name => portfolio.flickr_user_name,
        :remote_user_id => portfolio.flickr_user_id,
        :remote_user_email => portfolio.flickr_user_email,
        :portfolio_id => portfolio.id
      })
    end
  end

  def self.down
  end
end
