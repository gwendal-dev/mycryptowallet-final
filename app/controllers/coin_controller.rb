class CoinController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    if current_user
      @alerts = Alert.where(user_id: current_user.id)
      @arr_coins = []
      @arr_alerts = []
      @arr_prices = []
      @alerts.each do |alert|
        @arr_coins << alert.coin.upcase
        @arr_alerts << alert.value
        @arr_prices << alert.price
      end
    end
    @coin = Coin.where(title: params[:format])
    if current_user
      @user_id = current_user.id
      @apis = Api.where(user: current_user)
    end
  end
end
