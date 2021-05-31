class PositionsController < ApplicationController
  def new
    @portfolio = Portfolio.find(params[:portfolio_id])
    @position = Position.new
    @coins = Coin.all
    @apis = Api.where(key: ENV["KEY"])
  end

  def create
    @apis = Api.where(key: ENV["KEY"])
    @portfolio = Portfolio.find(params[:portfolio_id])
    @position = Position.new(position_params)
    @position.portfolio_id = @portfolio.id
    @coin = Coin.find(params[:position][:coin])
    if params[:position][:coin] != ""
      @coin.quantity = @coin.sum(params[:portfolio_id])
    end
    @position.coin = @coin
    if @position.save!
      if params[:position][:card] == "0"
        redirect_to portfolio_path(params[:portfolio_id])
      elsif params[:position][:card] == "1"
        redirect_to portfolio_cards_path(params[:portfolio_id])
      end
    else
      render :new
    end
  end

  def destroy
    @apis = Api.where(key: ENV["KEY"])
    @position = Position.find(params[:id])
    @position.destroy
    redirect_to portfolio_path(:portfolio_id)
  end

  def position_params
    params.require(:position).permit(:coin_id, :entry_date, :quantity, :exit_date, :exchange, :portfolio, :card)
  end
end
