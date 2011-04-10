class ThemesController < ApplicationController
  layout "back"
  
  before_filter :ensure_admin
  
  def index
    @themes = Theme.all
  end

  def create
    Theme.create!(params[:theme])
    redirect_to themes_path
  end

  def update
    Theme.find(params[:id]).update_attributes(params[:theme])
    redirect_to themes_path
  end

  def edit
    @theme = Theme.find(params[:id])
  end

end
