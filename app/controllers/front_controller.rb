class FrontController < ApplicationController
  skip_before_filter :find_current_portfolio
  before_filter :find_front_portfolio
  
  def showcase
    @category = params[:category_id].blank? ? @portfolio.categories.first : Category.find(params[:category_id])
  end

  def about
  end
  
  private 
  def find_front_portfolio
    @portfolio = Portfolio.find_by_slug(params[:slug])
  end
end
