class MarketController < ApplicationController
  def index
    @portfolios = Portfolio.where(user: current_user)
    @coins = Coin.all
    @total = 0
    @positions = Position.where(portfolio: @portfolios)
    @positions.each do |position|
      @coins.each do |coin|
        if position.coin == coin
          @total += position.quantity * coin.price
        end
      end
    end
  end
end
