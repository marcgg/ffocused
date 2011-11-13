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

  def self.init_from_callback(code, current_portfolio)
    oauth = Koala::Facebook::OAuth.new(FACEBOOK_APPLICATION_API_KEY, FACEBOOK_APPLICATION_SECRET, FACEBOOK_CALLBACK_URL)
    token = oauth.get_access_token(code)
    graph = Koala::Facebook::GraphAPI.new(token)
    user = graph.get_object("me")

    existing = RemoteAccount::Facebook.find(:first, :conditions => {:portfolio_id => current_portfolio.id, :remote_user_id => user["id"]})

    if existing.nil?
      RemoteAccount::Facebook.create!(
          :portfolio_id => current_portfolio.id,
          :access_token => token,
          :remote_user_name => user["name"],
          :remote_user_id => user["id"]
        )
    else
      existing.update_attribute(:access_token, token)
    end
  end
end
