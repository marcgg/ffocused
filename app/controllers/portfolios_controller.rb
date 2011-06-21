class PortfoliosController < ApplicationController
  layout "back"
  
  def order_categories
    params[:item_ids].each_with_index do |item_id, i|
      @current_portfolio.categories.find(item_id).update_attribute(:position, i)
    end
    render :nothing => true
  end

  def edit
  end

  def show
  end

  def update
    if @current_portfolio.update_attributes(params[:portfolio])
      flash[:notice] = {:title =>t("success"), :text => t("portfolios.update.notice_text")}
    else
      flash[:error] = {:title =>t("error"), :text => @current_portfolio.errors.full_messages.join(", ")}
    end
    redirect_to portfolio_path(@current_portfolio)
  end

end
