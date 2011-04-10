class FrontController < ApplicationController
  skip_before_filter :find_current_portfolio
  before_filter :find_front_portfolio
  
  def showcase
    if params[:category_id].blank?
      @category = @portfolio.categories.first
    else
      @category = Category.find(params[:category_id])
    end
  end

  def about
  end
  
  private 
  def find_front_portfolio
    @portfolio = Portfolio.find(params[:id])
  end
end
