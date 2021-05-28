class CoinController < ApplicationController
  def index
    @coin = Coin.find(params[:format])
  end
end
