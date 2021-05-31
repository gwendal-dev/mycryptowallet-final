class PositionsController < ApplicationController
  def new
    @portfolio = Portfolio.find(params[:portfolio_id])
    @position = Position.new
    @coins = Coin.all
    @apis = Api.all
  end

  def create
    @apis = Api.all
    @portfolio = Portfolio.find(params[:portfolio_id])
    @position = Position.new(position_params)
    @position.portfolio_id = @portfolio.id
    if params[:position][:coin] != ""
      @coin = Coin.find(params[:position][:coin])
    else
      @coin = 0
    end
    if params[:position][:coin] != ""
      @coin.quantity = @coin.sum(params[:portfolio_id])
    end
    if @coin != 0
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
    render :new if @coin == 0
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
