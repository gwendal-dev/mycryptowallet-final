class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    if (current_user)
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
    @apis = Api.where(user: current_user)
    @homes = 1
    if Portfolio.where(user: current_user).first == nil
      @portfolio = Portfolio.new
      @portfolio.user = current_user
      @portfolio.title = "Main"
      @portfolio.save
    end
  end
end
