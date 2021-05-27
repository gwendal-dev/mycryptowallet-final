class CardsController < ApplicationController
  def index
    @portfolio = Portfolio.find(params[:portfolio_id])
    @coins = Coin.all
    @total = 0
    @positions = Position.where(portfolio_id: params[:portfolio_id])
    @positions.each do |position|
      @coins.each do |coin|
        if position.coin == coin
          @total += position.quantity * coin.price
        end
      end
    end
  end
end
