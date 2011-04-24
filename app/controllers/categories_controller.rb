class CategoriesController < ApplicationController
  layout 'back'
    
  def index
    @categories = @current_portfolio.categories
  end

  def edit
  end
  
  def order_photos
    @category = @current_portfolio.categories.find(params[:id])
    params[:item_ids].each_with_index do |item_id, i|
      @category.photos.find(item_id).update_attribute(:position, i)
    end
    render :nothing => true
  end
  
  def reset_category
    @category = @current_portfolio.categories.find(params[:id])
    @category.photos.destroy_all
    @category.set_photos_from_flickr
    flash[:notice] = {:title => t("categories.reset_category.title"), :text => t("categories.reset_category.text")}
    redirect_to category_path(@category)
  end
  
  def create
    @category = Category.create(params[:category].merge(:portfolio_id => @current_portfolio.id))
    redirect_to category_path(@category)
  end

  def show
    @category = @current_portfolio.categories.find(params[:id])
  end

end
