class CategoriesController < ApplicationController
  layout 'back'
    
  def index
    @categories = @current_portfolio.categories
  end

  def edit
  end
  
  def destroy
    @category = @current_portfolio.categories.find(params[:id])
    @category.destroy
    render :nothing => true
  end
  
  def order_photos
    @category = @current_portfolio.categories.find(params[:id])
    params[:item_ids].each_with_index do |item_id, i|
      @category.photos.find(item_id).update_attribute(:position, i)
    end
    render :nothing => true
  end
  
  def reset
    @category = @current_portfolio.categories.find(params[:id])
    @category.photos.destroy_all
    @category.set_photos_from_flickr
    flash[:notice] = {:title => t("categories.reset.title"), :text => t("categories.reset.text")}
    redirect_to category_path(@category)
  end
  
  def refresh
    @category = @current_portfolio.categories.find(params[:id])
    @category.set_photos_from_flickr
    flash[:notice] = {:title => t("categories.refresh.title"), :text => t("categories.refresh.text")}
    redirect_to category_path(@category)
  end
  
  def create
    @category = params[:type].constantize.new(params[:category].merge(:portfolio_id => @current_portfolio.id))
    if @category.save
      flash[:notice] = {:title => t("categories.create.success_title"), :text => t("categories.create.success_text")}
      redirect_to category_path(@category)
    else
      flash[:error] = {:title => t("categories.create.error_title"), :text => t("categories.create.error_text", :errors => @category.errors.full_messages.join(", "))}
      redirect_to categories_path
    end
  end

  def show
    @category = @current_portfolio.categories.find(params[:id])
  end

end
