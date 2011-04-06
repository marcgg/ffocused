class Portfolio < ActiveRecord::Base
  has_many :categories
  
  before_save :save_flickr_user_id, :if => Proc.new{ |app| app.changes.keys.include?("flickr_user_name")}
  
  def save_flickr_user_id
    self.flickr_user_id = Flickr::Request.call_method("people.findByUsername", {:username => flickr_user_name})["user"]["nsid"]
  end
  
  def setup?
    !flickr_user_name.blank?
  end
end
