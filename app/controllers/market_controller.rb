class MarketController < ApplicationController
  def index
    @coins = Coin.all
  end
end
