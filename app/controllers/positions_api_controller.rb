class PositionsApiController < ApplicationController
  def new
    @alerts = Alert.where(user_id: current_user.id)
    @arr_coins = []
    @arr_alerts = []
    @arr_prices = []
    @alerts.each do |alert|
      @arr_coins << alert.coin.upcase
      @arr_alerts << alert.value
      @arr_prices << alert.price
    end
    @api = Api.find(params[:api_id])
    @position = Position.new
    @coins = Coin.all
    @apis = Api.where(user: current_user)
  end

  def create
    @alerts = Alert.where(user_id: current_user.id)
    @arr_coins = []
    @arr_alerts = []
    @arr_prices = []
    @alerts.each do |alert|
      @arr_coins << alert.coin.upcase
      @arr_alerts << alert.value
      @arr_prices << alert.price
    end
    @apis = Api.where(user: current_user)
    @api = Api.find(params[:api_id])
    @position = Position.new(position_params)
    @position.api_id = @api.id
    @coin = Coin.find(params[:position][:coin])
    @portfolio = Portfolio.first
    @position.portfolio = @portfolio
    @position.coin = @coin
    if params[:api] == 1
      if @position.save!
        redirect_to api_path(params[:api_id])
      else
        render :new
      end
    else
      if @position.save!
        redirect_to portfolios_path
      else
        render :new
      end
    end
  end

  def destroy
    @alerts = Alert.where(user_id: current_user.id)
    @arr_coins = []
    @arr_alerts = []
    @arr_prices = []
    @alerts.each do |alert|
      @arr_coins << alert.coin.upcase
      @arr_alerts << alert.value
      @arr_prices << alert.price
    end
    @apis = Api.where(user: current_user)
    @position = Position.find(params[:id])
    @position.destroy
    redirect_to portfolio_path(:portfolio_id)
  end

  def position_params
    params.require(:position).permit(:coin_id, :entry_date, :quantity, :exit_date, :exchange, :portfolio, :card, :index)
  end
end
