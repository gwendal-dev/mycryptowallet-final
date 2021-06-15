require 'json'
require 'net/http'

class InfosController < ApplicationController
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
    @data = get_API
    @apis = Api.where(user: current_user)
  end

  def show

  end

  private

  def get_API
    @apis = Api.where(user: current_user)
    url = 'https://api.lunarcrush.com/v2?data=feeds&sources=news&type=chronological&key=bju9urccdhffjgowh16was'
    uri = URI(url)
    response = Net::HTTP.get(uri)
    data =JSON.parse(response)

  end
end
