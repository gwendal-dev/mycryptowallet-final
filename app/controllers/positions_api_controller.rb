class PositionsApiController < ApplicationController
  def new
    @api = Api.find(params[:api_id])
    @position = Position.new
    @coins = Coin.all
    @apis = Api.all
  end

  def create
    @apis = Api.all
    @api = Api.find(params[:api_id])
    @position = Position.new(position_params)
    @position.api_id = @api.id
    @coin = Coin.find(params[:position][:coin])
    @portfolio = Portfolio.first
    @position.portfolio = @portfolio
    @position.coin = @coin
    if @position.save!
      redirect_to api_path(params[:api_id])
    else
      render :new
    end
  end

  def destroy
    @apis = Api.all
    @position = Position.find(params[:id])
    @position.destroy
    redirect_to portfolio_path(:portfolio_id)
  end

  def position_params
    params.require(:position).permit(:coin_id, :entry_date, :quantity, :exit_date, :exchange, :portfolio, :card)
  end
end
