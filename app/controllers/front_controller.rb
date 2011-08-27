class FrontController < ApplicationController
  skip_before_filter :find_current_portfolio
  skip_before_filter :ensure_portfolio_setup
  before_filter :find_front_portfolio

  def showcase
    @category = params[:category_slug].blank? ? @portfolio.categories.first : Category.find_by_slug(params[:category_slug])
    @portfolio.theme_id = params[:theme_id] if params[:theme_id]
  end

  def about
  end

  private

  def find_front_portfolio
    @portfolio = Portfolio.find_by_slug(params[:slug])
  end

end
