class CategoriesController < ApplicationController
  layout 'back'

  before_filter :find_category, :only => [:edit, :destroy, :update]

  def index
    @categories = @current_portfolio.categories
    @remote_accounts = @current_portfolio.remote_accounts
  end

  def edit
  end

  def fetch_form
    remote_account = @current_portfolio.remote_accounts.find(params[:remote_account_id])
    render :partial => "/categories/forms/#{remote_account.class_name}", :locals => {:remote_account => remote_account}
  end

  def update
    params[:category] = params[:category_from_set] if params[:category].blank?
    params[:category] = params[:category_from_tag] if params[:category].blank?
    if @category.update_attributes(
                    :title => params[:category][:title],
                    :slug => params[:category][:slug],
                    :description => params[:category][:description]
                    )
      flash[:notice] = {:title => t("categories.update.success_title"), :text => t("categories.update.success_text")}
    else
      flash[:error] = {:title => t("categories.update.error_title"), :text => t("categories.update.error_text")}
    end
    redirect_to edit_category_path(@category)
  end

  def destroy
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
    @category.reset
    flash[:notice] = {:title => t("categories.reset.title"), :text => t("categories.reset.text")}
    redirect_to category_path(@category)
  end

  def refresh
    @category = @current_portfolio.categories.find(params[:id])
    @category.refresh
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

  protected

  def find_category
    @category = @current_portfolio.categories.find(params[:id])
  end

end
