class FrontController < ApplicationController
  skip_before_filter :find_current_portfolio
  
  def showcase
    @portfolio = Portfolio.find(params[:id])
    if params[:category_id].blank?
      @category = @portfolio.categories.first
    else
      @category = Category.find(params[:category_id])
    end
  end

end
