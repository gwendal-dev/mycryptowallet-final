class DarkModeController < ApplicationController
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
    @dark_mode = Dark_mode.new
  end

  def create
  end
end
