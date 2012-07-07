class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  before_filter :find_current_portfolio
  before_filter :ensure_portfolio_setup

  def find_current_portfolio
    if current_user.nil?
      logger.info "Invalid User Session"
      redirect_to "/login"
    else
      @current_portfolio = current_user.portfolio
      if @current_portfolio.nil?
        logger.info "Invalid Portfolio for User #{current_user.id}"
        redirect_to root_path
      end
    end
  end

  private

  def ensure_portfolio_setup
    redirect_to not_setup_portfolio_path(@current_portfolio) if @current_portfolio and !@current_portfolio.setup?
  end

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end

  def ensure_admin
    raise Exception unless current_user.is_admin?
  end

  def require_no_user 
     if current_user 
       flash[:notice] = "You must be logged out to access this page" 
       redirect_to root_url 
       return false 
     end
   end
end
