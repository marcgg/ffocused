class Portfolio < ActiveRecord::Base
  validates_uniqueness_of :slug
  validates_presence_of :slug
  belongs_to :user
  before_validation :set_slug
  has_many :categories, :order => "position ASC"
  before_save :save_flickr_user_id, :if => Proc.new{ |app| app.changes.keys.include?("flickr_user_email")}
  
  def set_slug
    self.slug = "portfolio-#{rand(1000000)}-#{Time.now.strftime("%d%m%Y")}" if self.new_record?
  end
  
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
  
  def flickr_sets
    res = Flickr::Request.call_method("photosets.getList", {:user_id => flickr_user_id})
    res["photosets"] ? res["photosets"]["photoset"].map{|s| [s["title"]["_content"], s["id"]]} : []
  end
  
  def setup?
    !flickr_user_name.blank?
  end
end
