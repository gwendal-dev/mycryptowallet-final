class CardsController < ApplicationController
  def index
    @portfolio = Portfolio.find(params[:portfolio_id])
    @coins = Coin.all
    @total = 0
    @card = 1
    @positions = Position.where(portfolio_id: params[:portfolio_id])
    @coins.each do |coin|
      @total += coin.quantity * coin.price
    end
  end
end
