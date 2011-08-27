class RemoteAccount::Flickr < RemoteAccount
  validate :check_and_save_flickr_user_id, :if => Proc.new{|ra| ra.remote_user_id.blank?}

  def still_valid?
    # We do not require authentication for Flickr
    true
  end

  def public_name
    "flickr"
  end

  def check_and_save_flickr_user_id
    res = Fetchers::Flickr::Request.call_method("people.findByEmail", {:find_email => remote_user_email})
    if res["stat"] == "fail"
      errors.add(:remote_user_email, "bug")
    else
      self.remote_user_id = res["user"]["nsid"]
      self.remote_user_name = res["user"]["username"]["_content"]
    end
  end

  def flickr_sets
    res = Fetchers::Flickr::Request.call_method("photosets.getList", {:user_id => remote_user_id})
    res["photosets"] ? res["photosets"]["photoset"].map{|s| [s["title"]["_content"], s["id"]]} : []
  end

end
