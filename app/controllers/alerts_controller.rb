class AlertsController < ApplicationController
  def index

    @portfolio = Portfolio.where(user: current_user).first

    @alerts = Alert.where(user_id: current_user.id)
    @arr_coins = []
    @arr_alerts = []
    @arr_prices = []
    @alerts.each do |alert|
      @arr_coins << alert.coin.upcase
      @arr_alerts << alert.value
      @arr_prices << alert.price
    end
    @coins = Coin.where(title: @arr_coins)
    @coins.each do |coin|
      url = "https://api.lunarcrush.com/v2?data=assets&key=dobdvvfchtpmfr5qq1nu&symbol=#{coin.title}"
      uri = URI(url)
      response = Net::HTTP.get(uri)
      reponse = JSON.parse(response)
      begin
        price = reponse['data'][0]['price'].to_f
      rescue
        price = 0
      end
      coin.price = price
    end
      @apis = Api.where(user: current_user)
  end

  def show
  end

  def new
    @alert = Alert.new
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
    require 'net/http'
    require 'json'
    @coins = Coin.all
    price = 0
    @alert = Alert.new(alert_params)
      @coins.each do |coin|
        if coin.title == params[:alert][:coin].upcase
          coin.quantity = coin.sum(params[:id])
          url = "https://api.lunarcrush.com/v2?data=assets&key=dobdvvfchtpmfr5qq1nu&symbol=#{coin.title}"
          uri = URI(url)
          response = Net::HTTP.get(uri)
          reponse = JSON.parse(response)
          price = reponse['data'][0]['price'].to_f
          @alert.price = price
        end
      end
    @alert.user_id = current_user.id
    @apis = Api.where(user: current_user)
    if @alert.save
      redirect_to alerts_path
    else
      render :new
    end
  end

  def edit
    @alerts = Alert.where(user_id: current_user.id)
    @arr_coins = []
    @arr_alerts = []
    @arr_prices = []
    @alerts.each do |alert|
      @arr_coins << alert.coin.upcase
      @arr_alerts << alert.value
      @arr_prices << alert.price
    end
    alerts = Alert.all
    alerts.each do |alert|
      if alert.price
        if alert.price < alert.value
          if alert.price >= alert.value
            alert.alert = true
          end
        elsif alert.price > alert.value
          if alert.price <= alert.value
            alert.alert = true
          end
        end
      end
    end
    @alert = Alert.find(params[:id])
    @apis = Api.where(user: current_user)
  end

  def update
    @alerts = Alert.where(user_id: current_user.id)
    @arr_coins = []
    @arr_alerts = []
    @arr_prices = []
    @alerts.each do |alert|
      @arr_coins << alert.coin.upcase
      @arr_alerts << alert.value
      @arr_prices << alert.price
    end
    alerts = Alert.all
    alerts.each do |alert|
      if alert.price < alert.value
        if alert.price >= alert.value
          alert.alert = true
        end
      elsif alert.price > alert.value
        if alert.price <= alert.value
          alert.alert = true
        end
      end
    end
    @alert = Alert.find(params[:id])
    @alert.update(alert_params)
    require 'net/http'
    require 'json'
    @coins = Coin.all
    price = 0
      @coins.each do |coin|
        if coin.title == params[:alert][:coin].upcase
          coin.quantity = coin.sum(params[:id])
          url = "https://api.lunarcrush.com/v2?data=assets&key=dobdvvfchtpmfr5qq1nu&symbol=#{coin.title}"
          uri = URI(url)
          response = Net::HTTP.get(uri)
          reponse = JSON.parse(response)
          price = reponse['data'][0]['price'].to_f
          @alert.price = price
          @alert.save
        end
      end
    redirect_to alerts_path
    @apis = Api.where(user: current_user)
  end

  private

  def alert_params
    params.require(:alert).permit(:coin, :value, :user)
  end
end
