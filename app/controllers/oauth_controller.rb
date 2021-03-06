class OauthController < ApplicationController
  skip_before_filter :ensure_portfolio_setup

  def instagram_connect
    redirect_to ::Instagram.authorize_url(:redirect_uri => INSTAGRAM_CALLBACK_URL)
  end

  def facebook_callback
    RemoteAccount::Facebook.init_from_callback(params[:code], @current_portfolio)
    redirect_to remote_accounts_path
  end

  def instagram_callback
    RemoteAccount::InstagramAccount.init_from_callback(params[:code], @current_portfolio)
    redirect_to remote_accounts_path
  end
end
