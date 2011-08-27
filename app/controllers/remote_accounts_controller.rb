class RemoteAccountsController < ApplicationController
  layout "back"
  skip_before_filter :ensure_portfolio_setup, :only => [:create]
  before_filter :find_remote_account, :only => [:destroy, :expired]

  def index
    @remote_accounts = @current_portfolio.remote_accounts
  end

  def destroy
    @remote_account.destroy
    render :nothing => true
  end

  def expired
  end

  def create
    # TODO: Use Factory Instead
    raise "Invalid Subclass : #{params[:type]}" unless params[:type] and RemoteAccount::AVAILABLE_SUBCLASSES.include?(params[:type])

    params[:remote_account].merge!({:portfolio_id => @current_portfolio.id})
    @remote_account = params[:type].constantize.create(params[:remote_account])

    if @remote_account.errors.empty?
      flash[:notice] = {:title => t("remote_accounts.create.success_title"), :text => t("remote_accounts.create.success_text")}
      (@current_portfolio.remote_accounts.size == 1) ? redirect_to(portfolio_path @current_portfolio ) : redirect_to(remote_accounts_path)
    else
      flash[:error] = {:title => t("remote_accounts.create.failure_title"), :text => t("remote_accounts.create.failure_text")}
      redirect_to new_remote_account_path
    end
  end

  protected
  def find_remote_account
    @remote_account = @current_portfolio.remote_accounts.find(params[:id])
  end
end
