class PortfolioController < ApplicationController
  def index
    @coins = Coin.all
    @total = 0
    @positions = Position.all
    @positions.each do |position|
      @total += position.amount
    end
  end

  def show
  end

  def edit
  end

  def new
  end
end
