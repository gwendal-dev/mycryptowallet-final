class MarketController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    @portfolio = Portfolio.all
    @coins = Coin.all
    @total = 0
    @positions = Position.all
    @positions.each do |position|
      @coins.each do |coin|
        if position.coin == coin
          @total += position.quantity * coin.price
        end
      end
    end
  end
end
