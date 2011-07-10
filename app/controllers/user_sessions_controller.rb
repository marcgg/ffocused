class UserSessionsController < ApplicationController
  skip_before_filter :find_current_portfolio
  layout "back"
  
  def new
    @user_session = UserSession.new
  end
  
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = {:title => t("user_sessions.create.success_title"), :text =>  t("user_sessions.create.success_text")}
      redirect_to portfolio_path(current_user.id)
    else
      flash[:error] = {:title => t("user_sessions.create.error_title"), :text =>  t("user_sessions.create.error_text")}
      render :action => 'new'
    end
  end

  def destroy
    @user_session = UserSession.find
    @user_session.destroy
    flash[:notice] = "Successfully logged out."
    redirect_to root_url
  end
end
