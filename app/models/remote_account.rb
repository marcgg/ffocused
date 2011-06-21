class RemoteAccount < ActiveRecord::Base
  belongs_to :portfolio
  
  AVAILABLE_ACCOUNTS = ["flickr", "facebook"]
  AVAILABLE_SUBCLASSES = ["RemoteAccount::Flickr", "RemoteAccount::Facebook"]
  
  def class_name
    self.class.to_s.demodulize.downcase
  end
end
