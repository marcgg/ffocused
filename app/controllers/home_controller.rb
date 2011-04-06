class HomeController < ApplicationController
  skip_before_filter :find_current_portfolio
  
  def index
  end
end
