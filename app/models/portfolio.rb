class Portfolio < ActiveRecord::Base
  has_many :categories
  
  before_save :save_flickr_user_id, :if => Proc.new{ |app| app.changes.keys.include?("flickr_user_email")}
  
  def save_flickr_user_id
    res = Flickr::Request.call_method("people.findByEmail", {:find_email => flickr_user_email})
    self.flickr_user_id = res["user"]["nsid"]
    self.flickr_user_name = res["user"]["username"]["_content"]
  end
  
  def setup?
    !flickr_user_name.blank?
  end
end
