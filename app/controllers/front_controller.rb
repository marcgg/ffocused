class FrontController < ApplicationController
  skip_before_filter :find_current_portfolio
  skip_before_filter :ensure_portfolio_setup
  before_filter :find_front_portfolio
  before_filter :find_category
  before_filter :setup_theme_preview, :except => [:about]

  def showcase
    @category.update_stats unless current_user and current_user.portfolio.id == @portfolio.id
  end

  def single_photo
    @photo = Photo.find(params[:photo_id])
    @photo.update_stats unless current_user and current_user.portfolio.id == @portfolio.id
  end

  def about
  end

  private

  def find_category
    @category = params[:category_slug].blank? ? @portfolio.categories.first : Category.find_by_slug(params[:category_slug])    
  end

  def find_front_portfolio
    @portfolio = Portfolio.find_by_slug(params[:slug])
  end

  def setup_theme_preview
    @portfolio.theme_id = params[:theme_id] if params[:theme_id]
  end

end
