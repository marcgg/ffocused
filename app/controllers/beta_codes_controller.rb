class BetaCodesController < ApplicationController
  layout "back"
  before_filter :ensure_admin

  def create
    BetaCode.create!(params[:beta_code])
    redirect_to admin_path
  end
end
