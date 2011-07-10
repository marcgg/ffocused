class OauthController < ApplicationController
  def instagram_connect
    redirect_to ::Instagram.authorize_url(:redirect_uri => INSTAGRAM_CALLBACK_URL)
  end
  
  def facebook_callback
    oauth = Koala::Facebook::OAuth.new(FACEBOOK_APPLICATION_API_KEY, FACEBOOK_APPLICATION_SECRET, FACEBOOK_CALLBACK_URL)
    token = oauth.get_access_token(params[:code])
    graph = Koala::Facebook::GraphAPI.new(token)
    user = graph.get_object("me")
    RemoteAccount::Facebook.create!(
        :portfolio_id => @current_portfolio.id,
        :access_token => token,
        :remote_user_name => user["name"],
        :remote_user_id => user["id"]
      )
    redirect_to remote_accounts_path
  end
  
  def instagram_callback
    response = ::Instagram.get_access_token(params[:code], :redirect_uri => INSTAGRAM_CALLBACK_URL)
    user = Fetchers::Instalight::User.new(response.access_token)
    user_data = user.call_method("self")
    RemoteAccount::InstagramAccount.create!(
        :portfolio_id => @current_portfolio.id,
        :access_token => response.access_token,
        :remote_user_name => user_data["username"],
        :remote_user_id => user_data["id"]
      )
    redirect_to remote_accounts_path
  end
end
