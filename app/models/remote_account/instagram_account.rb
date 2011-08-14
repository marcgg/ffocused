class RemoteAccount::InstagramAccount < RemoteAccount
  def public_name
    "instagram"
  end

  def photos
    user = Fetchers::Instalight::User.new(access_token)
    user_data = user.call_method("#{remote_user_id}/media/recent", ["count=100"])
  end
end
