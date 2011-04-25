class PhotosController < ApplicationController
  def destroy
    @category = @current_portfolio.categories.find(params[:category_id])
    @photo = @category.photos.find(params[:id])
    @photo.destroy
    render :nothing => true
  end

end
