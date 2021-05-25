class MarketController < ApplicationController
  def index
    @coins = Coin.all
    @total = 0
    positions = Position.all
    positions.each do |position|
      @total += position.amount
    end
  end
end
