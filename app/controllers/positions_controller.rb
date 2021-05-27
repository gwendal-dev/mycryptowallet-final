class PositionsController < ApplicationController
  def new
    @portfolio = Portfolio.find(params[:portfolio_id])
    @position = Position.new
    @coins = Coin.all
  end

  def create
    @portfolio = Portfolio.find(params[:portfolio_id])
    @position = Position.new(position_params)
    @position.portfolio = @portfolio
    @coin = Coin.find(params[:position][:coin])
    @position.coin = @coin
    if @position.save!
      redirect_to portfolio_path(@portfolio)
    else
      render :new
    end
  end

  def destroy
    @position = Position.find(params[:id])
    @position.destroy
    redirect_to portfolio_path(:portfolio_id)
  end

  def position_params
    params.require(:position).permit(:coin_id, :entry_date, :quantity, :exit_date, :exchange, :portfolio_id)
  end
end
