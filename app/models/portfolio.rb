class Portfolio < ActiveRecord::Base
  validates_uniqueness_of :slug
  belongs_to :user
  has_many :categories, :order => "position ASC"
  before_save :save_flickr_user_id, :if => Proc.new{ |app| app.changes.keys.include?("flickr_user_email")}
  
  def theme
    THEMES[theme_id]
  end
  
  def save_flickr_user_id
    res = Flickr::Request.call_method("people.findByEmail", {:find_email => flickr_user_email})
    if res["stat"] == "fail"
      self.flickr_user_email
    else
      self.flickr_user_id = res["user"]["nsid"]
      self.flickr_user_name = res["user"]["username"]["_content"]
    end
  end
  
  def setup?
    !flickr_user_name.blank?
  end
end
