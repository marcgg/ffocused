class RemoteAccount::Facebook < RemoteAccount

  def public_name
    "facebook"
  end

  def still_valid?
    begin
      graph = Koala::Facebook::GraphAPI.new(self.access_token)
      res = graph.get_object("me")
      return res["id"].to_s == remote_user_id.to_s
    rescue Exception => e
      return false
    end
  end

  def facebook_albums
    begin
      graph = Koala::Facebook::GraphAPI.new(self.access_token)
      res = graph.get_connections(remote_user_id, "albums", :fields => "id,name,count", :limit => 100)
    rescue Exception => e
      return e
    end
    res.map{|s| ["#{s["name"]} (#{s["count"]} photos)", s["id"]]}
  end
end
