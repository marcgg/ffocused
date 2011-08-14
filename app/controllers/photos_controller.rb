class PhotosController < ApplicationController
  layout "back"
  before_filter :find_photo_and_category, :only => [:destroy, :edit, :update]

  def destroy
    @photo.mark_as_destroyed
    render :nothing => true
  end

  def edit
  end

  def update
    @photo.update_attributes!(params[:photo])
    redirect_to category_path(@category)
  end

  protected

    def find_photo_and_category
      @category = @current_portfolio.categories.find(params[:category_id])
      @photo = @category.photos.find(params[:id])
    end

end
