class RemoteAccount::Facebook < RemoteAccount
  validates_presence_of :remote_profile_url
  validate :check_and_save_facebook_user_id
  
  def check_and_save_facebook_user_id
    remote_profile_url =~ /(?:http:\/\/)?(?:www.)?facebook.com\/(?:(?:\w)*#!\/)?(?:pages\/)?(?:[\w\-]*\/)*([\w\-]*)/
    if $1.blank?
      errors.add(:remote_profile_url, "invalid")
    else
      graph = Koala::Facebook::GraphAPI.new
      res = graph.get_object($1)
      self.remote_user_id = res["id"]
      self.remote_user_name = res["name"]
    end
  end
  
  def facebook_albums
    begin
      graph = Koala::Facebook::GraphAPI.new("2227470867|2.AQDfkS7iH5DtezoM.3600.1308693600.0-560289256|MdaysY4jFnreqvBJW2gn-6xJsk4")
      res = graph.get_connections(remote_user_id, "albums", :fields => "id,name,count", :limit => 100)
    rescue
      res = []
    end
    res.map{|s| ["#{s["name"]} (#{s["count"]} photos)", s["id"]]}
  end
end
