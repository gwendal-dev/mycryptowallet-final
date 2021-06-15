class PositionsController < ApplicationController
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
    @portfolio = Portfolio.find(params[:portfolio_id])
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
    @portfolio = Portfolio.find(params[:portfolio_id])
    @position = Position.new(position_params)
    @position.portfolio_id = @portfolio.id
    if params[:position][:coin] != ""
      @coin = Coin.where(title: params[:position][:coin].upcase).first
    else
      @coin = 0
    end

    @api = Api.first
      if @api != nil
        @position.api = @api
      else
        @position.api = Api.new
      end

    if @coin != 0 && @coin != nil
      @coin.quantity = @coin.sum(params[:portfolio_id])
    end
    if @coin != 0 && @coin != nil
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
    render :new if @coin == 0 || @coin == nil
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
    params.require(:position).permit(:coin_id, :entry_date, :quantity, :exit_date, :exchange, :portfolio, :card, :price_entry)
  end
end
