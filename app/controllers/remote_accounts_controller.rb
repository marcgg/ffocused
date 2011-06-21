class RemoteAccountsController < ApplicationController
  layout "back"
  
  def index
    @remote_accounts = @current_portfolio.remote_accounts
  end

  def create
    # TODO: Use Factory Instead
    raise "Invalid Subclass : #{params[:type]}" unless params[:type] and RemoteAccount::AVAILABLE_SUBCLASSES.include?(params[:type])
    params[:remote_account].merge!({:portfolio_id => @current_portfolio.id})
    @remote_account = params[:type].constantize.create(params[:remote_account])
    if @remote_account.errors.empty?
      flash[:notice] = {:title => t("remote_accounts.create.success_title"), :text => t("remote_accounts.create.success_text")}
      if @current_portfolio.remote_accounts.size == 1 
        redirect_to portfolio_path(@current_portfolio)
      else
        redirect_to remote_accounts_path
      end
    else
      flash[:error] = {:title => t("remote_accounts.create.failure_title"), :text => t("remote_accounts.create.failure_text")}
      redirect_to new_remote_account_path
    end
  end
end
