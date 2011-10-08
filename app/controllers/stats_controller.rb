class StatsController < ApplicationController
  layout "back"

  def index
    @photos = @current_portfolio.photos.activated.printed
  end

end
