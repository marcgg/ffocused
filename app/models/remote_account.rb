class RemoteAccount < ActiveRecord::Base
  belongs_to :portfolio
  has_many :categories, :dependent => :destroy
  
  AVAILABLE_ACCOUNTS = ["flickr", "facebook", "instagram"]
  AVAILABLE_SUBCLASSES = ["RemoteAccount::Flickr", "RemoteAccount::Facebook", "RemoteAccount::InstagramAccount"]
  
  def class_name
    self.class.to_s.demodulize.downcase
  end
end
