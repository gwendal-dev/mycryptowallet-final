class CoinController < ApplicationController
  def index
    @portfolio = Portfolio.find(params[:portfolio_id])
    @coin = Coin.find(params[:format])
  end
end
