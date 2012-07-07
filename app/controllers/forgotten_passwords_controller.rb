class ForgottenPasswordsController < ApplicationController
  skip_before_filter :find_current_portfolio
  skip_before_filter :ensure_portfolio_setup
  before_filter :load_user_using_perishable_token, :only => [:edit, :update]
  before_filter :require_no_user  
  layout "back"

  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    user = User.find_by_login_or_email(params[:user_session][:login])
    if user
      user.enable_password_reset!
      Mailer.forgotten_password_instructions(user).deliver
      flash[:notice] = {:title => t("forgotten_passwords.create.success_title"), :text =>  t("forgotten_passwords.create.success_text")}
      redirect_to reset_password_url
    else
      flash[:error] = {:title => t("forgotten_passwords.create.error_title"), :text =>  t("forgotten_passwords.create.error_text")}
      render :action => 'new'
    end
  end

  def edit
  end

  def update
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]

    if @user.save
      flash[:notice] = {:title => t("forgotten_passwords.update.success_title"), :text =>  t("forgotten_passwords.update.success_text")}
      redirect_to portfolio_path(@user.portfolio.id)
    else
      flash[:error] = {:title => t("forgotten_passwords.update.error_title"), :text =>  t("forgotten_passwords.update.error_text")}
      render :action => :edit
    end
  end

  private
  def load_user_using_perishable_token
    @user = User.find_using_perishable_token(params[:id])
    unless @user
      flash[:error] = {:title => t("forgotten_passwords.edit.error_title"), :text =>  t("forgotten_passwords.edit.error_text")}
      redirect_to root_url
    end
  end
end
