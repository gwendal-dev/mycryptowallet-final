class ApiController < ApplicationController
  def index
    @portfolio = Portfolio.find(params[:portfolio_id])
  end
end
