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
    user.call_method("#{remote_user_id}/media/recent", ["count=100"])
  end

  def self.init_from_callback(code, current_portfolio)
    response = ::Instagram.get_access_token(code, :redirect_uri => INSTAGRAM_CALLBACK_URL)
    user = Fetchers::Instalight::User.new(response.access_token)
    user_data = user.call_method("self")

    existing = RemoteAccount::InstagramAccount.find(:first, :conditions => {:portfolio_id => current_portfolio.id, :remote_user_id => user_data["id"]})

    if existing.nil?
      RemoteAccount::InstagramAccount.create!(
          :portfolio_id => current_portfolio.id,
          :access_token => response.access_token,
          :remote_user_name => user_data["username"],
          :remote_user_id => user_data["id"]
        )
    else
      existing.update_attribute(:access_token, response.access_token)
    end
  end
end
