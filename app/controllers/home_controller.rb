class HomeController < ApplicationController
  skip_before_filter :find_current_portfolio

  def index
  end

  def contact
  end

  def terms
  end
end
