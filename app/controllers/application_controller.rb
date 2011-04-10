class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :find_current_portfolio
  
  def find_current_portfolio
    puts "session[:current_portfolio_id]= #{session[:current_portfolio_id]}"
    @current_portfolio = Portfolio.find(session[:current_portfolio_id])
  end
  
end
