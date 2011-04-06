class CategoriesController < ApplicationController
  layout 'back'
  
  def index
    @categories = @current_portfolio.categories
  end

  def edit
  end
  
  def create
    @category = Category.create(params[:category].merge(:portfolio_id => @current_portfolio.id))
    redirect_to category_path(@category)
  end

  def show
    @category = @current_portfolio.categories.find(params[:id])
  end

end
