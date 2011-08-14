class FutureUsersController < ApplicationController
  before_filter :ensure_admin, :only => [:handle]

  def create
    FutureUser.create!(params[:future_user])
    redirect_to "/"
  end

  def handle
    FutureUser.find(params[:id]).update_attribute(:handled, true)
    redirect_to admin_path
  end
end

