class OauthController < ApplicationController
  skip_before_filter :ensure_portfolio_setup

  def instagram_connect
    redirect_to ::Instagram.authorize_url(:redirect_uri => INSTAGRAM_CALLBACK_URL)
  end

  # TODO: Refactor both methods into maybe one
  # At least make it a bit more DRY because this isn't good

  def facebook_callback
    oauth = Koala::Facebook::OAuth.new(FACEBOOK_APPLICATION_API_KEY, FACEBOOK_APPLICATION_SECRET, FACEBOOK_CALLBACK_URL)
    token = oauth.get_access_token(params[:code])
    graph = Koala::Facebook::GraphAPI.new(token)
    user = graph.get_object("me")

    existing = RemoteAccount::Facebook.find(:first, :conditions => {:portfolio_id => @current_portfolio.id, :remote_user_id => user["id"]})

    if existing.nil?
      RemoteAccount::Facebook.create!(
          :portfolio_id => @current_portfolio.id,
          :access_token => token,
          :remote_user_name => user["name"],
          :remote_user_id => user["id"]
        )
    else
      existing.update_attribute(:access_token, token)
    end

    redirect_to remote_accounts_path
  end

  def instagram_callback
    response = ::Instagram.get_access_token(params[:code], :redirect_uri => INSTAGRAM_CALLBACK_URL)
    user = Fetchers::Instalight::User.new(response.access_token)
    user_data = user.call_method("self")

    existing = RemoteAccount::InstagramAccount.find(:first, :conditions => {:portfolio_id => @current_portfolio.id, :remote_user_id => user_data["id"]})

    if existing.nil?
      RemoteAccount::InstagramAccount.create!(
          :portfolio_id => @current_portfolio.id,
          :access_token => response.access_token,
          :remote_user_name => user_data["username"],
          :remote_user_id => user_data["id"]
        )
    else
      existing.update_attribute(:access_token, response.access_token)
    end
    redirect_to remote_accounts_path
  end
end
