class StatsController < ApplicationController
  layout "back"

  def index
    @photos = @current_portfolio.photos.activated.printed(:order => "prints DESC")
  end

end
