class RemoteAccount::InstagramAccount < RemoteAccount
  def public_name
    "instagram"
  end

  def still_valid?
    user = Fetchers::Instalight::User.new(access_token)
    res = user.call_method("self")
    return res["id"].to_s == self.remote_user_id.to_s
  rescue Exception => e
    return false
  end

  def photos
    user = Fetchers::Instalight::User.new(access_token)
    user_data = user.call_method("#{remote_user_id}/media/recent", ["count=100"])
  end
end
