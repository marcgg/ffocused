class AdminController < ApplicationController
  layout "back"
  before_filter :ensure_admin
  
  def index
    @users = User.all
  end
end
