class FutureUsersController < ApplicationController
  skip_before_filter :find_current_portfolio, :only => [:create]
  skip_before_filter :ensure_portfolio_setup, :only => [:create]

  before_filter :ensure_admin, :only => [:handle]

  def create
    FutureUser.create!(:email => params[:email])
    render :nothing => true
  end

  def handle
    FutureUser.find(params[:id]).update_attribute(:handled, true)
    redirect_to admin_path
  end
end

